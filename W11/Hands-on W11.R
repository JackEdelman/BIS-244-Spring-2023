## Hands-on 1
library(gapminder)
library(tidyverse)
library(ggrepel)
library(socviz)

# Considering American Sociological Association Section Membership dataset (asasec), For 2013 show the relatioship between members and revenues and also cosider different colors for having journal. Use the linear prediction line.
head(asasec)

asasec <- asasec

p <- ggplot(data = subset(asasec, Year == 2013),
            mapping = aes(x = Members, y = Revenues, label = Sname))

p1 <- p + geom_point(mapping = aes(color = Journal)) +
  geom_smooth(method = "lm")

## Hands-on 2
# Lebel those outliers with revenue bigger than $10,000

p2 <- p1 + 
  geom_text_repel(data=subset(asasec, Year == 2013 & Revenues > 10000), size = 2)

p2

p3 <- p2 + labs(x="Membership",
                y="Revenues",
                color = "Section has own Journal",
                title = "ASA Sections",
                subtitle = "2013 Calendar year.",
                caption = "Source: ASA annual report.")

## Hands-on 3
# Revise the code below to use *Accent* for color
p <- ggplot(data = organdata,
            mapping = aes(x = roads, y = donors, color = world))
p + geom_point(size = 1.5) +
  theme(legend.position = "top")

p + geom_point() + scale_color_manual(values = cb_palette)
## Hands-on 4
# Find Lehigh university and Rutgers University color codes and dispaly it here 

Lehigh_colors <- c("#653819","#Fed141","#C8102E")
Rutgers_colors <- c("#CC0033","#5F6A72","#000000")
color_comp(Lehigh_colors)
color_comp(Rutgers_colors)
