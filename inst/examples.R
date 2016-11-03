library(dplyr)
library(mrgsolve)
mod1 <- mread("one_cmpt_f")
mod1 %>% 
  ev(amt = 100, addl = 5, ii = 12) %>%
  mrgexplore

mod1@args
mrgsolve::idata_set


as.numeric(param(mod1))

mrgsolve:::code(mod1)
mrgsolve:::details(mod1)
















## not annotated? doesn't pick up details
mod_tmdd <- mread("tmdd", modlib())

mod_pk2 <- mread("pk2cmt", modlib())
# doesn't have any dosing by default
mod_pk2 %>% ev(amt=100, ii=6,addl=8) %>% mrgexplore
# many params, probably will be worth adding a break
mod_pk3 <- mread("pk3cmt", modlib())
mrgsolve:::details(mod_pk3)
# doesn't have any dosing by default
mod_pk3 %>% 
  ev(amt=100, ii=6,addl=8) %>% 
  mrgexplore


mrgsolve:::details(mod_pk3)

as.numeric(param(mod_tmdd))
mrgsolve:::code(mod_tmdd)

viral1 <- mread("viral1", modlib())
as.numeric(param(viral1))
mrgsolve:::code(viral1)
param(mod_pk2)











