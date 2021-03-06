Import analysis and lineage growth analysis
================
Magnus Nygård Osnes
25 jan 2022

The input for this analysis is the results from the maximum likelihood
geographical state mapping on the full phylogenetic tree.

From the mapped geographical lineage distributions we can derive the
number of importation and local transmission events for each location
(based on the available sequences). NB. we do not account for unobserved
infections (sequences), and hence the estimated number only reflects the
fraction of *sequenced* genomes that is assigned to specific lineages.
The relative growth between the lineages (growth of an transmission
lineage implies local transmission), is an important quantity and tells
us how dominant specific lineages have become over time. This too could
be affected by nonrandom sampling such as targeted sampling of lineages
with anitibiotic resistance.

``` r
LineageHomology::Summarize_import_local_transmission(replicates_NOR)
```

    ##                            2.5%          50%        97.5%
    ## Import              498.2000000  507.0000000  514.6000000
    ## Local transmission 1209.4000000 1217.0000000 1225.8000000
    ## Import / Total        0.2889791    0.2940835    0.2984919

``` r
LineageHomology::Summarize_import_local_transmission(replicates_AUS)
```

    ##                            2.5%          50%       97.5%
    ## Import              284.1000000  287.0000000  288.800000
    ## Local transmission 1914.2000000 1916.0000000 1918.900000
    ## Import / Total        0.1289605    0.1302769    0.131094

``` r
LineageHomology::Summarize_import_local_transmission(replicates_USA)
```

    ##                            2.5%          50%        97.5%
    ## Import              303.2000000  306.0000000  314.5000000
    ## Local transmission 2057.5000000 2066.0000000 2068.8000000
    ## Import / Total        0.1278246    0.1290051    0.1325885

In Norway we estimate that there is 29% importation. This is more than
twice the estimated amount in USA and Australia (each ca. 13%)

## Cumulative growth of transmission lineages

The following plots show the cumulative number of sequences obtained
from each estimated transmission lineage over time

``` r
name_date_NOR = name_date[name_date$name%in%nor_tips,]
linfo_NOR = lineage_info(Result_NOR,name_date = name_date_NOR)
LineageHomology::lineage_growth_cumulative(linfo_NOR,datelims=c("2015-01-01","2019-06-15","1 year"))
```

![](03_import_analysis_files/figure-gfm/unnamed-chunk-4-1.png)<!-- -->

``` r
name_date_AUS = name_date[name_date$name%in%aus_tips,]
linfo_AUS = lineage_info(Result_AUS,name_date = name_date_AUS)
LineageHomology::lineage_growth_cumulative(linfo_AUS,datelims=c("2016-07-01","2018-06-15","5 months"))
```

![](03_import_analysis_files/figure-gfm/unnamed-chunk-4-2.png)<!-- -->

``` r
name_date_USA = name_date[name_date$name%in%usa_tips,]
linfo_USA = lineage_info(Result_USA,name_date = name_date_USA)
LineageHomology::lineage_growth_cumulative(linfo_USA,datelims=c("2008-07-01","2019-06-15","2 year"))
```

![](03_import_analysis_files/figure-gfm/unnamed-chunk-4-3.png)<!-- -->

## Import and local transmission over time

![](03_import_analysis_files/figure-gfm/remedy003-1.png)<!-- -->

![](03_import_analysis_files/figure-gfm/remedy004-1.png)<!-- -->

![](03_import_analysis_files/figure-gfm/remedy005-1.png)<!-- -->
