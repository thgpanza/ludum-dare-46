# Ludum Dare 46
## Farm Defense
### A minute of history...

I've been wanting to participate in a Ludum Dare since I first discovered it back in 2017 but I never could, because of college and a recurring appointment that I have on weekends. However this time, "thanks" to the quarantine, I could finally participate in my first one, so I decided that I would use this first Ludum Dare as a dedicatory to myself and my (still small) dev life by doing these two things:

- First and foremost, I would use **GameMaker Studio 2** on it no matter what, since this was the engine that truly got me into game development (actually the 1.x version but you got the idea).
- And secondly, I would try my best to have an idea (based on the theme) for a **tower defense game**, because when I was watching a Ludum Dare stream (by Shaun Spalding) for the first time I was also messing with a small tower defense prototype, in GMS 2.

That being said, and knowing that I was heavily inspired by the "Suits" episode of Netflix's series "Love, Death & Robots", here is my first try at this freaking awesome game jam! :D

_(It's unfinished (for now) and kinda ugly, but I hope y'all like the idea, heheh)_

### Initial Idea

The player controls a farmer (not visible in-game) who needs to defend his family against waves of "alien" creatures. **The game has two states: "Daylight" and "Night"**, described below:

**During the “Daylight State”** the player can choose to plant seeds on his farm, with growth time based on waves of enemies (i.e. turns), spending part of his/her **coins** (earned through **planting** and a small percentage of the corn leftover from the previous night) to increase his/her income. The player can also spend his coins on improvements to make his life easier during the main game loop, which takes place at the night time.

**During the “Night State”** the tower defense genre appears, with the player needing to defend the way to his farm (and family). To do this, he must spend his/her **corns** (which are acquired each time an enemy dies) to place different (upgradable) towers close to that path, so that they automatically attack the creatures that will come on each turn.

The player also has **abilities** (unlocked/purchased during the Daylight State) that can be used during the Night State of the game. Example: a tractor that goes on the opposite path of enemies (starting from the end of the path and going to the beginning) destroying all the creatures it touches until there (except for tougher/stronger enemies, whom this ability would just damage).

The **planting system** works as follows: during the Daylight State the player can enter a "planting mode" (named “Shop” in the game) to buy and plant seeds (with the coins he/she has). Each seed takes a different amount of time (measured in turns) to grow and have different buy/harvest values.

### Missing Features

- Player abilities;
- Different tower types;
- Different tower levels/upgrades;
- More seeds (currently there are 3 types of seeds);
- Non-pixelgrammer art/sprites (heheh);
- The visual difference between the Daylight and Night States;
- Game balancing (towers, enemies, waves, and seeds).

### Commands

#### While in the Title Screen

- Press **"Space"** to start the game.

![New_Title_Screen_Screenshot](/Screenshots/New_Title_Screen_Screenshot.png)

#### While in the Daylight State

- Press **“S”** to enter the **“Shop Mode”** and **“1”**, **“2”** or **“3”** to select the desired seed;
- **“Left (Mouse) Click”** to plant the selected seed in the available soil tiles;
- **“Right (Mouse) Click”** on a grown seed to harvest (and automatically sell) it;
- Press **“N”** to start the next enemy wave.

![New_Daylight_Screenshot](/Screenshots/New_Daylight_Screenshot.png)

#### While in the Night State

- Press **“S”** to enter the **“Shop Mode”** and “1” to select the **“Basic Tower”**;
- **“Left (Mouse) Click”** to build the selected tower in a non-path tile;
- **"Right (Mouse) Click"** on a tower to sell it.

![New_Night_Screenshot](/Screenshots/New_Night_Screenshot.png)

#### Postscript

**PS:** I will **keep working** on this game until my initial idea is **fully complete**, leaving on my itch.io page both the **Jam version** and the **updated version** for download.

**PSS:** As soon as I translate the **Trello board** that I used (and will continue to use) for this game to English I'll also leave the link on my itch.io page for anyone that wants to check the roadmap.
