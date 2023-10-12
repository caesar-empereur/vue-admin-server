package com.repository;

import cn.hutool.core.bean.BeanUtil;
import com.vo.PageParameter;
import org.springframework.data.domain.*;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.NoRepositoryBean;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.*;

/**
 * @Description 针对单表的分页查询
 * @author: yangyingyang
 * @date: 2018/11/27.
 */
@NoRepositoryBean
public interface ModelPageRepository<M> extends JpaRepository<M, String>, JpaSpecificationExecutor<M> {
    //查询一个
    default M findOneQuery(M paramModel){
        Optional<M> optionalM = findOne(this.buildSpecEqual(paramModel));
        if (optionalM.isPresent()){
            return optionalM.get();
        }
        return null;
    }

    //根据排序查询最前面一个
    default M findOneTop(M paramModel, Sort sort){
        List<M> list = findAll(this.buildSpecEqual(paramModel));
        if (list == null || list.isEmpty()){
            return null;
        }
        return list.get(0);
    }

    //列表查询
    default List<M> listQuery(M paramModel){
        return findAll(this.buildSpecEqual(paramModel));
    }

    //根据 like 条件列表查询
    default List<M> listQueryWithLike(M paramModel, Map<String, String> map){
        Specification<M> specificationEqual = this.buildSpecEqual(paramModel);
        Specification<M> specificationLike = this.buildSpecLike(map);
        return findAll(specificationEqual.and(specificationLike));
    }

    //根据分页参数, 条件 分页查询
    default Page<M> pageQuery(M paramModel, Integer pageNum, Integer pageSize){
        if (pageNum <= 1){
            pageNum = 1;
        }
        return findAll(this.buildSpecEqual(paramModel), PageRequest.of(pageNum-1, pageSize));
    }

    //根据 equal, like 条件进行分页查询
    default Page<M> pageQueryWithLike(M paramModel, Map<String, String> map, Integer pageNum, Integer pageSize){
        if (pageNum <= 1){
            pageNum = 1;
        }
        Specification<M> specificationEqual = this.buildSpecEqual(paramModel);
        Specification<M> specificationLike = this.buildSpecLike(map);
        return findAll(specificationEqual.and(specificationLike), PageRequest.of(pageNum-1, pageSize));
    }

    //进行某个字段的时间段分页查询
    default Page<M> pageQueryWithTime(String filed, String startTime, String endTime, Integer pageNum, Integer pageSize){
        if (pageNum <= 1){
            pageNum = 1;
        }
        return findAll(this.buildTimeParamSpec(filed, startTime, endTime), PageRequest.of(pageNum-1, pageSize));
    }

    // 根据表字段，有值的构建 相等条件 查询
    default Specification<M> buildSpecEqual(M model){
        Specification<M> specification = new Specification<M>() {
            @Override
            public Predicate toPredicate(Root<M> root, CriteriaQuery<?> query, CriteriaBuilder builder) {
                List<Predicate> predicates =new ArrayList<>();
                Map<String, Object> mapParam = BeanUtil.beanToMap(model);
                for (Map.Entry<String, Object> entry : mapParam.entrySet()) {
                    if (entry.getValue()!=null){
                        predicates.add(builder.equal(root.get(entry.getKey()).as(String.class), entry.getValue()));
                    }
                }
                Predicate[] pre = new Predicate[predicates.size()];
                return query.where(predicates.toArray(pre)).getRestriction();
            }
        };
        return specification;
    }

    //根据给定字段，构建时间段查询条件
    default Specification<M> buildTimeParamSpec(String filed, String startTime, String endTime){
        Specification<M> specification = new Specification<M>() {
            @Override
            public Predicate toPredicate(Root<M> root, CriteriaQuery<?> query, CriteriaBuilder builder) {
                List<Predicate> predicates =new ArrayList<>();
                predicates.add(builder.greaterThanOrEqualTo(root.get(filed), DateUtils.parseToDate(startTime)));
                predicates.add(builder.lessThanOrEqualTo(root.get(filed), DateUtils.parseToDate(endTime)));
                Predicate[] pre = new Predicate[predicates.size()];
                return query.where(predicates.toArray(pre)).getRestriction();
            }
        };
        return specification;
    }

    // 根据给定字段，有值的构建  like条件 查询
    default Specification<M> buildSpecLike(Map<String, String> map){
        Specification<M> specification = new Specification<M>() {
            @Override
            public Predicate toPredicate(Root<M> root, CriteriaQuery<?> query, CriteriaBuilder builder) {
                List<Predicate> predicates =new ArrayList<>();
                for (Map.Entry<String, String> entry : map.entrySet()) {
                    if (entry.getValue()!=null){
                        predicates.add(builder.like(root.get(entry.getKey()).as(String.class), buildLikeString(entry.getValue())));
                    }
                }
                Predicate[] pre = new Predicate[predicates.size()];
                return query.where(predicates.toArray(pre)).getRestriction();
            }
        };
        return specification;
    }

    default String buildLikeString(String value){
        return "%" + value + "%";
    }

}
