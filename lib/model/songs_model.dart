class Songs {
  String name;
  String author;
  bool isDesignl;

  Songs({this.author, this.name, this.isDesignl});
}

List<Songs> getSongs = [
  Songs(name: "Ingenue", author: "Atoms for Peace", isDesignl: false),
  Songs(
      name: "Before Your Very Eyes",
      author: "Atoms for Peace",
      isDesignl: false),
  Songs(name: "Default", author: "Atoms for Peace", isDesignl: true),
  Songs(name: "Anima", author: "Thom York", isDesignl: false),
  Songs(name: "Harrowdown Hill", author: "Thom York", isDesignl: false),
  Songs(name: "Black Swan", author: "Thom York", isDesignl: false),
  Songs(name: "Decks Black", author: "T-Habit Band", isDesignl: false),
  Songs(name: "Rocks Belts", author: "T-Habit Band", isDesignl: false),
];
