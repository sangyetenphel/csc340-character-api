package com.csc340.characters_api;

import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class CharacterService {

    private final CharacterRepository repository;

    public CharacterService(CharacterRepository repository) {
        this.repository = repository;
    }

    public List<Character> getAllCharacters() {
        return repository.findAll();
    }

    public Character getCharacterById(Long id) {
        return repository.findById(id).orElse(null);
    }

    public Character addCharacter(Character character) {
        return repository.save(character);
    }

    public Character updateCharacter(Long id, Character updatedCharacter) {

        Character character = repository.findById(id).orElse(null);

        if(character != null) {

            character.setName(updatedCharacter.getName());
            character.setDescription(updatedCharacter.getDescription());
            character.setUniverse(updatedCharacter.getUniverse());
            character.setSpecies(updatedCharacter.getSpecies());

            return repository.save(character);
        }

        return null;
    }

    public void deleteCharacter(Long id) {
        repository.deleteById(id);
    }

    public List<Character> getCharactersByUniverse(String universe) {
        return repository.findByUniverse(universe);
    }

    public List<Character> searchCharacters(String name) {
        return repository.findByNameContainingIgnoreCase(name);
    }

}