[![.github/workflows/ant.yml](https://github.com/Funz/plugin-Rmd/actions/workflows/ant.yml/badge.svg)](https://github.com/Funz/plugin-Rmd/actions/workflows/ant.yml)

# Funz plugin: Rmd

This plugin is dedicated to launch RMarkDown rendering from Funz.
It supports the following syntax and features:

  * Input
    * file type supported: *.Rmd, any other format for resources
    * parameter syntax: 
      * variable syntax: `?[...]`
      * formula syntax: `!{...}`
      * comment char: `/`
    * example input file:
        ```
        ---
        title: "Untitled"
        ---
        we set x1 to ?[x1~[1,2]]
        we set x2 to ?x2
        mean_speed=`r mean(cars$speed) + !{?x2 + 1.23 | #.###}`
        ```
      * will identify input:
        * x1, expected to vary inside [1,2]
        * x2, expected to vary inside [0,1] (by default)
      * replace `!{?x2 + 1.23 | #.###}` expression by its evaluation

  * Output
    * file type supported: *.html
    * read any named value printed with '=`r ...', like 
    * example output file:
        ```
        ...
        <p>mean_speed=15.4</p>
        ...
        ```
        * will return output:
          * mean_speed=15.4



![Analytics](https://ga-beacon.appspot.com/UA-109580-20/plugin-Rmd)
