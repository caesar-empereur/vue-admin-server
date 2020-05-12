package com.repository;

import com.alibaba.fastjson.JSON;
import com.vo.PageParameter;
import org.springframework.beans.BeanUtils;
import org.springframework.data.domain.*;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.NoRepositoryBean;
import org.springframework.util.StringUtils;
import sun.reflect.generics.reflectiveObjects.ParameterizedTypeImpl;

import java.lang.reflect.Field;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.*;
import java.util.stream.Collectors;

/**
 * @Description 针对单表的分页查询
 * @author: yangyingyang
 * @date: 2018/11/27.
 */
@NoRepositoryBean
public interface ModelPageRepository<M> extends JpaRepository<M, String> {
    
    default Page<M> pageQuery(PageParameter pageParameter) {
        M entity = convertParamToModel(pageParameter);
        Set<String> fields = getAllFields(pageParameter);

        if (fields.size()==0){
            return findAll(convertPageRequest(pageParameter));
        }
        ExampleMatcher exampleMatcher = ExampleMatcher.matching();
        for (String field : fields) {
            exampleMatcher.withMatcher(field, ExampleMatcher.GenericPropertyMatchers.exact());
        }
        Example<M> example = Example.of(entity, exampleMatcher);

        return findAll(example, convertPageRequest(pageParameter));
    }
    
    default M findOne(M model){
        List<String> fields = Arrays.asList(model.getClass().getDeclaredFields())
                                    .stream()
                                    .map(Field::getName)
                                    .collect(Collectors.toList());
        ExampleMatcher exampleMatcher = ExampleMatcher.matching();
        for (String field : fields) {
            exampleMatcher.withMatcher(field, ExampleMatcher.GenericPropertyMatchers.exact());
        }
        Example<M> example = Example.of(model, exampleMatcher);
        Optional<M> result = findOne(example);
        if (result.isPresent()){
            return result.get();
        }
        return null;
    }
    
    default Set<String> getAllFields(PageParameter clazz) {
        Set<String> fieldList = new HashSet<>();
        Field[] fields = clazz.getClass().getDeclaredFields();
        for (Field field : fields) {
            fieldList.add(field.getName());
        }
        return fieldList;
    }

    default Sort getSort(){
        return Sort.by(new Sort.Order(Sort.Direction.DESC, "createTime"));
    }


    default PageRequest convertPageRequest(PageParameter pageParameter){
        if (pageParameter.getPageNo()<1){
            pageParameter.setPageNo(1);
        }
        return PageRequest.of(pageParameter.getPageNo() - 1,
                              pageParameter.getPageSize(),
                              getSort());
    }
    /**
     * 处理新版的jpa分页查询方式，将继承PageParameter 的字段转移到对应模型
     * 
     * @param parameter
     * @return
     */
    default M convertParamToModel(PageParameter parameter) {
        M model = null;
        outerLoop: for (Class clazz : getClass().getInterfaces()) {
            for (Type type : clazz.getGenericInterfaces()) {
                if (type instanceof ParameterizedType
                    && ModelPageRepository.class == ((ParameterizedTypeImpl) type).getRawType()) {
                    Class<M> mClass =
                                    ((Class<M>) ((ParameterizedTypeImpl) type).getActualTypeArguments()[0]);
                    try {
                        model = mClass.newInstance();
                    }
                    catch (InstantiationException | IllegalAccessException e) {
                        throw new RuntimeException("实例化异常");
                    }
                    break outerLoop;
                }
            }
        }
        if (model == null){
            throw new RuntimeException("实例化异常");
        }
        Map map = JSON.parseObject(JSON.toJSONString(parameter), Map.class);
        Iterator<Map.Entry> it = map.entrySet().iterator();
        while(it.hasNext()){
            Map.Entry entry = it.next();
            if (entry.getValue() instanceof String){
                String value = (String) entry.getValue();
                if (StringUtils.isEmpty(value)){
                    it.remove();
                }
            }
        }
        parameter = JSON.parseObject(JSON.toJSONString(map), parameter.getClass());
        BeanUtils.copyProperties(parameter, model);
        return model;
    }
    
}
