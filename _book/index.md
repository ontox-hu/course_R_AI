---
title: "Intro into R, Reproducible research and machine learning"
author: ""
site: bookdown::bookdown_site
output: 
    bookdown::gitbook:
        css: style.css
        number_sections: false
        anchor_sections: false
        split_by: chapter
        config:
            sharing:
                 github: yes
                 facebook: no
                 twitter: no
                 all: no
            toc:
                collapse: section
                scroll_highlight: yes
                before: <li class="toc-logo"><a href="./"><img style="float:left;" src="images/voorbeeldlogo2.png"></a> <h4 class=".paddingtitel ">DAUR1 </h2></li>
---






# Introduction {-}

Welcome to the course on the basics of data analysis in R and an intro in Machine learning. This course consists of 5 lessons. You can find these lessons in the menu on the left. Each lesson starts with a short introduction by the teachers. After that, you are supposed to study the lessons yourself and make the exercises. During the lessons, you can ask questions to the teachers and the teachers will provide feedback. It is very important that you make all exercises. You will not learn using R by reading about it. 

Please note: this is a crash course. We scheduled this course to allow you to throw yourself into R and be able to see yourself making progress very quickly. 

We wish you good luck and we hope you will have a lot of fun with R!

## Course outline

This page explains how the course is constructed and what will be expected from you.

**Schedule 2022:**

Day 1:

 - Intro to R and RStudio
 - Getting the materials from Github
 - R-syntax, objects, data types and classes
 - RMarkdown
 

Day 2:

 - Reading and cleaning data
 - Visualizations
 

Day 3:

 - Data wrangling
 

Day 4:

 - Functional programming
 - Writing functions
 

Day 5:

 - Machine Learning with {tidymodels}
 - Deep Learning with tensorflow for R



### Course material

The course material consists of the following:

- Instruction pages (menu to the left). 
- Exercises.

To navigate through the different materials, you can use the menu on the left. The course is based on the online book [R for Data Science](https://r4ds.had.co.nz/index.html).

### Lessons

Each lesson will consist of:

- a short introduction to the subject by the instructor;
- selfstudy of the instruction pages; 
- and making the exercises.

Each lesson, one or two instructors will be present to assist with the exercises and provide feedback. 

### Exercises

The exercises consist of writing R code to solve data analysis problems. Answers are available for each exercise. Most likely you will not finish all exercises during the lesson, which means that you will have to finish them in your own time. It is important to make all exercises: the only way to learn R is to practice, practice and practice by making the exercises. Some R functions and principles are only explained via the exercises.


### Rstudio server

During the course, we will use an **RStudio server**, which you can reach via [this link](https://daur.rstudio.hu.nl/) using a browser. You can log in to this RStudio server with your HU email address and with your HU password. Within the Rstudio environment you'll have to make an R Project (see instructions in lesson 1). Data files will be provided by the instructors and are present in the Rstudio server folder mabdaur/data. 

In case of any problems with the RStudio server, please contact marc.teunis@hu.nl.


## Learning objectives

After this course, you will be able to 

- use R to perform your analyses repoducible
- backup your work using version control in github
- implement literate programming in data analysis and visualization.
- communicate the results of data analysis and how you reached them using Rmarkdown
- explain the basics of machine learning in toxicology.
