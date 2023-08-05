package com.liivtogether.frame;

import java.util.List;

public interface LIIVService<K,V> {
    /**
     * 등록 및 가입 진행
     * argument: Object
     * return: null
     * */

    public void register(V v) throws Exception;

    public void remove(K k) throws Exception;

    public void modify(V v) throws Exception;

    public V get(K k) throws Exception;

    public List<V> get() throws Exception;
}
