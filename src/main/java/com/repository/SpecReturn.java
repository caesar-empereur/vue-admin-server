package com.repository;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

/**
 * @Description
 * @author: yangyingyang
 * @date: 2023/10/11.
 */
public interface SpecReturn<M> {

    Predicate toPredicate(Root<M> root, CriteriaQuery<?> query, CriteriaBuilder builder);
}
