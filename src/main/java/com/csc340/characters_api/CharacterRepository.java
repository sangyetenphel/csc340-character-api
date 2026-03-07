package com.csc340.characters_api;

import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface CharacterRepository extends JpaRepository<Character, Long> {

    List<Character> findByUniverse(String universe);

    List<Character> findByNameContainingIgnoreCase(String name);

}