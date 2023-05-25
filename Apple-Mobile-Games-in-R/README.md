# 2019 Revenue Analysis on Apple Mobile Games
Code Author: Ha Phuong Tran

At the close of 2019, the mobile gaming industry achieved a noteworthy $68.5 billion, representing 45% of the global game market. To fully capitalize on the immense opportunities within this market, game developers necessitate a comprehensive market overview. The primary aim of this project is unveil the variables that could potentially influence game revenue. This determination will be facilitated by two pivotal metrics: the average user rating and the rating count.

Games lacking average user rating values will be excluded from the analysis. The genre tags "Entertainment" and "Games" will be disregarded as they do not contribute meaningful insights. Games with fewer than 30 user ratings will also be omitted to prevent biased ratings from developers. The remaining data will be parsed and categorized into genres based on their characteristics:
- Puzzle: Includes Puzzle and Board games.
- Adventure: Encompasses Adventure, Role, and Role Playing games.
- Action: Comprises Action games.
- Family: Consists of Family, Education, and Trivia games.
- Simulation: Represents Simulation games.
- Other: Includes Casual and Card games.

## 1. The Landscape of Games on Appstore:
### 1.1. Overall Rating, Price, and Genres.

![Genres](https://github.com/hatranusa/data-science-projects-2023/blob/517e0d2ca2a57efc57fd0c41ef5f9e92ce08f35f/Apple-Mobile-Games-in-R/pictures/001_genre_number_average.png)

![Price Analysis](https://github.com/hatranusa/data-science-projects-2023/blob/adf2ff9502181ff8930f91718f28ddc39dded47a/Apple-Mobile-Games-in-R/pictures/002_paid_vs_free_game.png)

The genre that exhibits the highest prevalence on the Appstore is Puzzle, boasting a substantial collection of over 1000 games. It is closely followed by Simulation and Adventure games in terms of popularity. Conversely, the genre with the least presence is Family games, comprising a modest selection of approximately 300 games. Intriguingly, despite its popularity, Puzzle games receive the lowest average user rating, amounting to a mere 4.06 out of 5. In contrast, the genres of Action, Adventure, and Family games garner the highest average ratings, reaching an impressive 4.22 out of 5.

A majority of the games available in the market, specifically 81%, can be freely downloaded and enjoyed by users. In the paid game category, a notable 86% of games are priced at less than $5 for users to access and play. As the price increases, the percentage of such games decreases significantly. Free game developers have the opportunity to generate revenue through advertising and in-app purchases. Consequently, 77% of free games offer in-app purchases, while the remaining portion may rely on revenue generated from in-app advertising. In contrast, 38% of paid games provide in-app purchases, with the remaining 62% lacking such options.

### 1.2 Size Trend and Genres Trend.

![Time Series of Size Changes](https://github.com/hatranusa/data-science-projects-2023/blob/adf2ff9502181ff8930f91718f28ddc39dded47a/Apple-Mobile-Games-in-R/pictures/005_avg_size_over_time.png)

![Rate Change over Time](https://github.com/hatranusa/data-science-projects-2023/blob/adf2ff9502181ff8930f91718f28ddc39dded47a/Apple-Mobile-Games-in-R/pictures/006_rating_over_time.png)

![Genres over Time](https://github.com/hatranusa/data-science-projects-2023/blob/main/Apple-Mobile-Games-in-R/pictures/007_genres_trend.png)
