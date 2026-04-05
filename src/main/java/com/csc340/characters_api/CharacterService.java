package com.csc340.characters_api;

import java.util.List;

import org.springframework.stereotype.Service;

@Service
public class CharacterService {

  private final CharacterRepository characterRepository;

  public CharacterService(CharacterRepository characterRepository) {
    this.characterRepository = characterRepository;
  }

  public List<Character> getAllCharacters() {
    return characterRepository.findAll();
  }

  // public List<Character> getAllCharacters() {
//     List<Character> list = characterRepository.findAll();

//     for (Character c : list) {
//         System.out.println("DEBUG CHARACTER:");
//         System.out.println("ID: " + c.getCharacterId());
//         System.out.println("Name: " + c.getName());
//         System.out.println("Description: " + c.getDescription());
//         System.out.println("Universe: " + c.getUniverse());
//         System.out.println("Role: " + c.getRole());
//         System.out.println("Species: " + c.getSpecies());
//         System.out.println("PowerLevel: " + c.getPowerLevel());
//         System.out.println("------");
//     }

//     return list;
// }

  public Character createCharacter(Character character) {
    return characterRepository.save(character);
  }

  public Character getCharacterById(Long id) {
    return characterRepository.findById(id).orElse(null);
  }

  public Character updateCharacter(Long id, Character updatedCharacter) {
    return characterRepository.findById(id)
      .map(character -> {
        character.setName(updatedCharacter.getName());
        character.setRealName(updatedCharacter.getRealName());
        character.setDescription(updatedCharacter.getDescription());
        character.setFullDescription(updatedCharacter.getFullDescription());
        character.setUniverse(updatedCharacter.getUniverse());
        character.setRole(updatedCharacter.getRole());
        character.setSpecies(updatedCharacter.getSpecies());
        character.setPowerLevel(updatedCharacter.getPowerLevel());
        character.setAbilities(updatedCharacter.getAbilities());
        character.setImageUrl(updatedCharacter.getImageUrl());
        return characterRepository.save(character);
    })
    .orElse(null);
  }

  public void deleteCharacter(Long id) {
    characterRepository.deleteById(id);
  }

  public List<Character> getCharactersByUniverse(String universe) {
    return characterRepository.findByUniverse(universe);
  }

  public List<Character> searchCharactersByName(String name) {
    return characterRepository.findByName(name);
  }

}