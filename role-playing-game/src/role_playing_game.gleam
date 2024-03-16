import gleam/option.{type Option, None, Some}
import gleam/int

pub type Player {
  Player(name: Option(String), level: Int, health: Int, mana: Option(Int))
}

pub fn introduce(player: Player) -> String {
  case player {
    Player(Some(name), _, _, _) -> name
    Player(None, _, _, _) -> "Mighty Magician"
  }
}

pub fn revive(player: Player) -> Option(Player) {
  case player {
    Player(name, level, 0, None) -> Some(Player(name, level, 100, None))
    Player(name, level, 0, _) -> Some(Player(name, level, 100, Some(100)))
    _ -> None
  }
}

pub fn cast_spell(player: Player, cost: Int) -> #(Player, Int) {
  case player {
    Player(name, level, health, Some(mana)) if mana >= cost -> {
      let new_player = Player(name, level, health, Some(mana - cost))
      #(new_player, cost * 2)
    }
    Player(name, level, health, None) -> {
      let new_health = int.max(health - cost, 0)
      #(Player(name, level, new_health, None), 0)
    }
    _ -> #(player, 0)
  }
}
