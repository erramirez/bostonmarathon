#### BOSTON MARATHON DATA ANALYSIS ####

# using DATAPASTA RStudio addin for copy/pasting from web: https://github.com/MilesMcBain/datapasta

# finishers 2010-2018: http://registration.baa.org/2010/cf/Public/iframe_Statistics.htm (just change year)
# participation stats: http://www.baa.org/races/boston-marathon/boston-marathon-history/participation.aspx

devtools::install_github("hrbrmstr/hrbrthemes")

library(tidyverse)
library(hrbrthemes)
library(scales)

bmrunners <- tibble::tribble(
               ~year, ~total_entrants, ~male_entrants, ~female_entrants, ~total_finishers, ~male_finishers, ~female_finishers,
               1972,         1219,     1210,          9,         NA,    NA,          8,
               1973,         1574,     1562,         12,         NA,    NA,          6,
               1974,         1951,     1905,         46,         NA,    NA,         19,
               1975,         2365,     2313,         52,       1848,  1820,         28,
               1976,         2188,     2110,         78,       1161,  1133,         28,
               1977,         3040,     2899,        141,       2329,  2227,        102,
               1978,         4764,     4537,        227,       4071,  3885,        186,
               1979,         7927,     7400,        527,       5958,  5662,        296,
               1980,         5471,     5015,        456,       3665,  3428,        237,
               1981,         6881,     6203,        678,       5590,  5074,        516,
               1982,         7647,     6780,        867,       5046,  4562,        484,
               1983,         6674,     5949,        725,       5388,  4833,        555,
               1984,         6924,     6086,        838,       5290,  4708,        582,
               1985,         5595,     4894,        701,       3931,  3472,        459,
               1986,         4904,     4262,        642,       3750,  3294,        456,
               1987,         6399,     5406,        993,       5369,  4576,        793,
               1988,         6758,     5665,       1093,       5261,  4472,        789,
               1989,         6458,     5320,       1138,       5104,  4239,        865,
               1990,         9412,     7669,       1743,       7950,  6516,       1434,
               1991,         8686,     7124,       1562,       7642,  6291,       1351,
               1992,         9629,     7736,       1893,       8123,  6562,       1561,
               1993,         8930,     7069,       1861,       7517,  6013,       1504,
               1994,         9059,     7047,       2012,       8093,  6353,       1740,
               1995,         9416,     7241,       2175,       8258,  6409,       1849,
               1996,        38708,    29469,       9239,      35868, 27371,       8497,
               1997,        10471,     7473,       2998,       8891,  6414,       2477,
               1998,        11499,     7950,       3549,      10293,  7149,       3144,
               1999,        12797,     8507,       4290,      11274,  7511,       3763,
               2000,        17813,    11442,       6371,      15668, 10199,       5469,
               2001,        15606,     9895,       5711,      13408,  8594,       4814,
               2002,        16936,    10590,       6346,      14573,  9234,       5339,
               2003,        20223,    12626,       7597,      17030, 10728,       6302,
               2004,        20344,    12647,       7697,      16733, 10496,       6237,
               2005,        20405,    12504,       7901,      17528, 10884,       6644,
               2006,        22473,    13630,       8843,      19682, 12061,       7621,
               2007,        23869,    14344,       9525,      20339, 12365,       7974,
               2008,        25283,    14844,      10439,      21948, 13019,       8929,
               2009,        26331,    15397,      10934,      22843, 13545,       9298,
               2010,        26790,    15462,      11328,      22721, 13161,       9560,
               2011,        26964,    15445,      11462,      23913, 13839,      10074,
               2012,        26655,    15503,      11152,      21616, 12621,       8995,
               2013,        26839,    15233,      11606,      17600, 10649,       6951,
               2014,        35671,    19572,      16092,      31926, 17582,      14344,
               2015,        30251,    16500,      13751,      26598, 14580,      12018,
               2016,        30741,    16629,      14112,      26629, 14463,      12166,
               2017,        30074,    16376,      13698,      26400, 14431,      11969,
               2018,        29978,    16587,      13391,      25746, 14142,      11604 )


# initial plot
bmrunnersplot <- ggplot(bmrunners, aes(year)) +
  geom_line(aes(y = male_entrants, colour = "Male Entrants"), colour = "#2A5D46") +
  geom_line(aes(y = male_finishers, colour = "Male Finishers"), colour = "#2A5D46", linetype = 3) +
  geom_line(aes(y = female_entrants, colour = "Female Entrants"), colour = "#A9F062") +
  geom_line(aes(y = female_finishers, colour = "Female Finishers"), colour = "#A9F062", linetype = 3) +
  scale_y_continuous(labels = comma) +
  labs(title = "Boston Marathon Entries & Finishers",
       subtitle = "1972 - 2018",
       x = "Year",
       y = "Number of Runners",
       caption = "Entrant Total is since 1972, the first year of official participation by women.") +
  theme_ipsum()

ggsave("bmrunnersplotv1.tiff", width = 13.33, height = 7.5, units = "in" )
