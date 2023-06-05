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

## 1. The Background of Games on Appstore:
### 1.1. Rating, Price, and Genres.
![Genres](https://github.com/hatranusa/data-science-projects-2023/blob/517e0d2ca2a57efc57fd0c41ef5f9e92ce08f35f/Apple-Mobile-Games-in-R/pictures/001_genre_number_average.png)

The genre that exhibits the highest prevalence on the Appstore is Puzzle, boasting a substantial collection of over 1000 games. It is closely followed by Simulation and Adventure games in terms of popularity. Conversely, the genre with the least presence is Family games, comprising a modest selection of approximately 300 games. Intriguingly, despite its popularity, Puzzle games receive the lowest average user rating, amounting to a mere 4.06 out of 5. In contrast, the genres of Action, Adventure, and Family games garner the highest average ratings, reaching an impressive 4.22 out of 5.

![Price Analysis](https://github.com/hatranusa/data-science-projects-2023/blob/adf2ff9502181ff8930f91718f28ddc39dded47a/Apple-Mobile-Games-in-R/pictures/002_paid_vs_free_game.png)

A majority of the games available in the market, specifically 81%, can be freely downloaded and enjoyed by users. In the paid game category, a notable 86% of games are priced at less than $5 for users to access and play. As the price increases, the percentage of such games decreases significantly. Free game developers have the opportunity to generate revenue through advertising and in-app purchases. Consequently, 77% of free games offer in-app purchases, while the remaining portion may rely on revenue generated from in-app advertising. In contrast, 38% of paid games provide in-app purchases, with the remaining 62% lacking such options.

### 1.2 Size Trend and Genres Trend.
![Game Size Distribution](https://github.com/hatranusa/data-science-projects-2023/blob/main/Apple-Mobile-Games-in-R/pictures/003_game_size_dist.png)
![Game Size Distributions by Genres](https://github.com/hatranusa/data-science-projects-2023/blob/main/Apple-Mobile-Games-in-R/pictures/004_game_size_by_genres.png)
Most game sizes range below one gigabyte. Action, Adventure, and Simulation games have larger average sizes, likely due to the demand for advanced graphics and strategic elements. The remaining genres exhibit similar size distributions, primarily concentrated within the under 300mb range.

![Time Series of Size Changes](https://github.com/hatranusa/data-science-projects-2023/blob/adf2ff9502181ff8930f91718f28ddc39dded47a/Apple-Mobile-Games-in-R/pictures/005_avg_size_over_time.png)
Game sizes have experienced a significant increase from 2008 to 2019, expanding by approximately 12 times on average. Action, Adventure, and Simulation games boast the highest average sizes, ranging from around 435mb to 260mb, while Family games maintain a more modest average size of around 200mb.

![Rate Change over Time](https://github.com/hatranusa/data-science-projects-2023/blob/adf2ff9502181ff8930f91718f28ddc39dded47a/Apple-Mobile-Games-in-R/pictures/006_rating_over_time.png)
Average user ratings for all genres have shown an upward trend over time. In 2019, Simulation games achieve the highest average user rating, nearing 4.5. Adventure and Puzzle games demonstrate consistent growth since 2011, averaging around 4.3 in user ratings. Conversely, Action games have not displayed any noticeable improvement in customer satisfaction since 2012.

![Genres over Time](https://github.com/hatranusa/data-science-projects-2023/blob/main/Apple-Mobile-Games-in-R/pictures/007_genres_trend.png)
Since the dataset was collected in August 2019, the game counts for each genre in 2019 are incomplete. Therefore, the genre trend analysis will focus on the 2008-2018 period. The Y-axis indicates the number of games introduced on the Apple Appstore in specific years. From the graph, it is evident that Simulation games emerged as a dominant genre, starting with a relatively low number of introductions in 2008 and culminating in approximately 120 games introduced in 2018. Action and Adventure games follow a similar trend, experiencing significant growth from 2008 to 2016, followed by a slight decline. Puzzle genres, which held dominance from 2008 to 2015, subsequently experienced a consistent decline.

## 2. Factors behind User Rating and Rating Count:
### 2.1 AVG User Rating:
In this analysis, games are categorized into three size ranges: under 100mb, between 100mb-300mb, and over 300mb. These size categories provide developers with insights into different segments. "Under 100mb" games target the mass market, offering basic entertainment with minimal features, allowing widespread access with low hardware requirements. The "100mb-300mb" category caters to users who prioritize gaming and seek higher technical and graphical gameplay experiences. The final category caters to avid gamers, emphasizing intricate graphics and complex gameplay elements.

![avg user rating <100 mb](https://github.com/hatranusa/data-science-projects-2023/blob/main/Apple-Mobile-Games-in-R/pictures/008_avg_user_rating.png)
To provide a more accurate assessment of the relationship between game size and user ratings, additional data is required. However, we can gain a general understanding of this relationship. The advantage of smaller-sized games lies in their ease of play and modest requirements. Yet, determining the threshold between simplicity and meeting user expectations remains uncertain. Based on the boxplot graph, games with higher ratings (4 and 5 points) tend to have larger average sizes compared to those with lower ratings. Insufficiently small sizes may not meet the minimum requirements of users. In this category, games should ideally be 50mb or larger to fulfill the basic needs of users.

![avg user rating 100-300 mb](https://github.com/hatranusa/data-science-projects-2023/blob/main/Apple-Mobile-Games-in-R/pictures/009_rating_vs_size.png)
For the 100mb - 300mb category, a conclusive statement regarding the relationship between size and rating cannot be made with the current data. Although games with a rating of 1 point appear to have larger sizes, the limited number of games in this rating category undermines any firm conclusion. Collecting and analyzing more data is essential for a definitive and accurate statement.

![avg user rating >300 mb](https://github.com/hatranusa/data-science-projects-2023/blob/main/Apple-Mobile-Games-in-R/pictures/010_rating_vs_size_over_300.png)
Overall, games with higher ratings (4 and 5 points) tend to have larger sizes. However, there is a substantial overlap in size between good (4 and 5 rating points) and poor (below 4 rating points) games. Consequently, no definite conclusion can be drawn about the impact of size on this category. Obtaining more information about features is necessary to gain a clearer understanding of the effect of size in the 100mb - 300mb and over 300mb categories.

![Days since last Update](https://github.com/hatranusa/data-science-projects-2023/blob/main/Apple-Mobile-Games-in-R/pictures/011_days_since_last_update.png)
The number of days since the last update and the average user rating display a negative relationship. Shorter update intervals demonstrate a developer's ability to adapt and modify games to meet user expectations and market trends. The box plot reveals that games with higher ratings (4 and 5 points) have significantly shorter "days since last update" values (approximately 750 and 400 days as the median, respectively) compared to games with ratings of 3 points and below.

## 3. Conclusions and Solutions:
### 3.1 Conclusions:
Puzzle games dominate the Appstore game market, boasting a vast collection of over 1000 games. On average, Action, Adventure, and Family genres receive the highest average user ratings, scoring 4.22 points. Simulation has experienced a steady rise, both in terms of average user ratings and the number of game releases per year, making it a promising genre. The overall size of games on the market has grown significantly, expanding by an average factor of 12 since 2008. Free games have a prominent presence, covering 81% of the market.

### 3.2 Solutions:
Developers should prioritize Action, Adventure, and Simulation genres due to their high user ratings and consumer trends, with particular emphasis on Simulation, which exhibits substantial growth in both average user ratings and the number of new releases. Free games present a better focus category, as they tend to receive significantly higher average user ratings. Revenue generation for free games can be achieved through advertising and in-app purchases. In terms of size categories, "100-300mb" is the optimal range for free games, while "under-100mb" suits developers targeting paid games.
