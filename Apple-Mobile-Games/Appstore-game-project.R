library(tidyverse)
project1 <- read_csv(file.choose(),
                    col_types = cols("User Rating Count" = col_integer(),
                                      "Original Release Date" = col_date("%d/%m/%Y"),
                                      "Current Version Release Date" = col_date("%d/%m/%Y")))

#Cleanning:
project1 <- project1 %>% filter(!is.na(Average.User.Rating)) %>% 
  group_by(Primary.Genre) %>% summarise(count=n())%>% filter(count > 30)
sum(is.na(project1$`Average User Rating`))
#filter just games app and have user rating:
project1 <- project1 %>% 
  filter(`Primary Genre` == "Games" | `Primary Genre` == "Entertainment") %>%
  filter(!is.na(`Average User Rating`))



#Separating Genres:
project1 <- project1 %>% 
  extract(Genres,into = "Puzzle",regex = "(Puzzle|Board)",remove = F) %>%
  extract(Genres,into = "Adventure",regex = "(Adventure|Role|Role Playing)",remove = F) %>%
  extract(Genres,into = "Action",regex = "(Action)",remove = F) %>%
  extract(Genres,into = "Family",regex = "(Family|Education|Trivia)",remove = F)%>%
  extract(Genres,into = "Simulation",regex = "(Simulation)",remove = F)%>%
  extract(Genres,into = "Others",regex = "(Casual|Card)")

project1 <- project1 %>% 
  gather("Puzzle","Adventure","Action","Family","Simulation","Others",key="Genres",value= "cases",na.rm = T)%>%
  filter(`User Rating Count`> 30)


project %>% group_by(Genres) %>% summarise(count = n())
project$cases <- NULL
project$`Primary Genre` <- NULL
project$Size <- project$Size/1000000
project$URL <- NULL
project$`Icon URL` <- NULL
tibble(project)

#Divide Size into subgroup:
Sizegroup <- c()
for (val in project1$Size) {
  if (val < 100) {
    Sizegroup <- append(Sizegroup,"under 100Mb")
  } else if (val < 300) {
    Sizegroup <- append(Sizegroup,"100Mb - 300Mb")
  } else if (val  < 1000) {
    Sizegroup <- append(Sizegroup,"300Mb - 1Gb")
  } else {
    Sizegroup <- append(Sizegroup,"Over 1Gb")
  }
}
project1 <- cbind(project1, Sizegroup)


#user rating
Rating <- c()
for (val in project1$`Average User Rating`) {
  if (val < 2){
    Rating <- append(Rating, "1")
  } else if (val < 3) {
    Rating <- append(Rating, "2")
  } else if (val < 4) {
    Rating <- append(Rating, "3")
  } else if (val < 5) {
    Rating <- append(Rating, "4")
  } else {Rating <- append(Rating, "5")}
}
project1 <- cbind(project1, Rating)
summary(select(project1, `Average User Rating`, Rating))


ggplot(data=project)+ geom_bar(aes(x=Rating))+
  xlab("Average User Rating")+ ylab("Count")+
  ggtitle("Average User Rating Distribution")

#Price:
project %>% mutate(
  Price = ifelse(Price == 0, NA, Price)
) %>% filter(!is.na(Price))%>%
  ggplot(aes(x=Price)) + geom_bar() + 
  coord_cartesian(xlim = c(0,10)) +
  xlab("Price") +
  ylab("Count") +
  ggtitle("Price App Distribution")+
  theme(axis.title.x = element_text(size =15),
        axis.title.y = element_text(size =15),
        plot.title = element_text(size=25))
  
#Price outliers
project %>% mutate(
  price.app = ifelse(Price == 0, NA, Price)
) %>% filter(!is.na(price.app))%>%
  ggplot(aes(x=price.app)) + geom_bar() + 
  coord_cartesian(ylim = c(0,50))+
  xlab("Price")+
  ylab("Count")+
  ggtitle("Price App Distribution")+
  theme(axis.title.x = element_text(size =15),
        axis.title.y = element_text(size =15),
        plot.title = element_text(size=25))
#No. Developers:
project %>% group_by(`Age Rating`)%>%
  summarise(
  developers = n_distinct(Developer,na.rm = T)
) %>% arrange(developers)
#Age Rating:
project$Sizegroup <- NULL
project$`Age Rating` <- factor(project$`Age Rating`, ordered = T, levels = c("4+","9+","12+","17+"))
project %>% group_by(`Age Rating`) %>%
  arrange(`Age Rating`) %>% 
  ggplot() + geom_bar(aes(x=`Age Rating`))
#Size:
ggplot(data=project, aes(x=Size)) + 
  geom_histogram(binwidth = 50) + 
  coord_cartesian(xlim = c(0,1000))

#Primary Genres:
project %>% group_by(Genres) %>% 
  summarise(count=n())
ggplot(project, aes(x=Genres)) + geom_bar()

#COVARIANCE:

#User rating vs Genres:

project %>% group_by(Genres)%>%
  ggplot()+
  geom_violin(aes(x=Genres, y=`Average User Rating`))+
  xlab("Genres")+
  ylab("Average User Rating")+
  ggtitle("User Rating vs Genres")+
  theme(axis.title.x = element_text(size =15),
        axis.title.y = element_text(size =15),
        plot.title = element_text(size=25))
  
#User rating vs Size:
#--under 100mb:
project %>% filter(Sizegroup == "under 100Mb") %>%
  ggplot(aes(x=as.character(`Average User Rating`), y=Size)) + 
  geom_boxplot() +
  xlab("Average User Rating")+
  ylab("Size")+
  ggtitle("User Rating vs Size (< 100mb)")+
  theme(axis.title.x = element_text(size =15),
        axis.title.y = element_text(size =15),
        plot.title = element_text(size=25))
#--100mb-300mb
project %>% filter(Sizegroup == "100Mb - 300Mb") %>%
  ggplot(aes(x=as.character(`Average User Rating`), y=Size)) + 
  geom_boxplot() +
  xlab("Average User Rating")+
  ylab("Size")+
  ggtitle("User Rating vs Size (100Mb - 300Mb)")+
  theme(axis.title.x = element_text(size =15),
        axis.title.y = element_text(size =15),
        plot.title = element_text(size=25))
#--300mb - 1gb
project %>% filter(Sizegroup == "300Mb - 1Gb") %>%
  ggplot(aes(x=as.character(`Average User Rating`), y=Size)) + 
  geom_boxplot() +
  xlab("Average User Rating")+
  ylab("Size")+
  ggtitle("User Rating vs Size (300Mb - 1Gb)")+
  theme(axis.title.x = element_text(size =15),
        axis.title.y = element_text(size =15),
        plot.title = element_text(size=25))
#--Over 1gb
project %>% filter(Sizegroup == "Over 1Gb") %>%
  ggplot(aes(x=as.character(`Average User Rating`), y=Size)) + 
  geom_boxplot() +
  xlab("Average User Rating")+
  ylab("Size")+
  ggtitle("User Rating vs Size (Over 1Gb)")+
  theme(axis.title.x = element_text(size =15),
        axis.title.y = element_text(size =15),
        plot.title = element_text(size=25))

#Price vs User rating:
project %>% filter(!is.na(Price)) %>%
  ggplot(aes(x=as.character(Price), y=`Average User Rating`)) +
  geom_boxplot()
#Number of rating vs Genres: using weighting technique
### note: assign different weights to genres based on their proportion in the data
### note:
app_game.df %>% mutate(month = format(`Original Release Date`,"%m")) %>%
  group_by(month) %>% summarise(avg = mean(`Average User Rating`)) %>%
  ggplot() + geom_line(aes(x = month, y = avg, group=1))
### update vs user rating
project$update <- project$`Current Version Release Date` - project$`Original Release Date` 
project %>% group_by(`Average User Rating`) %>%
  ggplot() + geom_boxplot(aes(x=factor(`Average User Rating`), y = update))

### Age Rating and Rating:
project$`Age Rating`
ggplot(project, aes(`Age Rating`, y = `Average User Rating`)) + geom_violin()

