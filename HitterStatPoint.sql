select
	c.hname,
		round(((s.isop-0.146)/0.071*20+100)/2) as power_point,
		round(((c.havr-0.283)/0.037*20+100)/2) as contact_point,
		round(((s.hwalk-0.349)/0.039*20+100)/2) as eyes_point,
		round(((s.hraa_run-0.035)/1.687*20+100)/2) as run_point,
		round(((s.spd-3.807)/1.686*20+100)/2) as speed_point,
		round(((s.raa_def+0.01)/3.301*20+100)/2) as def_point
from test.hstat_classic c
	inner join (select
		sp.num,
		sp.isop, 
		sp.hwalk, 
		sp.hraa_run, 
		sp.spd, 
		d.raa_def
	from test.hstat_special sp inner join player_def d on sp.num = d.num) s
on c.num=s.num
where c.at_bat >= 100;
