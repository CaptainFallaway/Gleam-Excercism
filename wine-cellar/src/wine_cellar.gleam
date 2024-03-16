import gleam/list

pub type Wine {
  Wine(name: String, year: Int, country: String, color: Color)
}

pub type Color {
  Red
  Rose
  White
}

pub fn wines_of_color(wines: List(Wine), color: Color) -> List(Wine) {
  list.filter(wines, fn(w) {
    case w {
      Wine(_, _, _, c) -> c == color
    }
  })
}

pub fn wines_from_country(wines: List(Wine), country: String) -> List(Wine) {
  list.filter(wines, fn(w) {
    case w {
      Wine(_, _, c, _) -> c == country
    }
  })
}

// Please define the required labelled arguments for this function
pub fn filter(
  wines: List(Wine),
  color wine_color: Color,
  country wine_country: String,
) -> List(Wine) {
  list.filter(wines, fn(w) {
    case w {
      Wine(_, _, country, color) ->
        color == wine_color && country == wine_country
    }
  })
}
