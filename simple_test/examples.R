library(dplyr)
library(mrgexplore)
mod1 <- mread("one_cmpt_f")
mod1 %>% mrgexplore
mod1 %>% ev(amt=100, ii=6,addl=8) %>% mrgexplore


## not annotated? doesn't pick up details
mod_tmdd <- mread("tmdd", modlib())

# many params, probably will be worth adding a break
mod_pk3 <- mread("pk3cmt", modlib())
mrgsolve:::details(mod_pk3)
# doesn't have any dosing by default
mod_pk3 %>% ev(amt=100, ii=6,addl=8) %>% mrgexplore
