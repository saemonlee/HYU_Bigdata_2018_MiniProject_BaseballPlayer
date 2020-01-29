select d.name as pname, d.team, psc.p_position, psc.era, psc.inning, psc.win, psc.lose, psc.save, psc.hold, psc.stamina, psc.st_rank, psc.b_speed, psc.sp_rank, psc.b_power, psc.p_rank, psc.command, psc.c_rank, psc.e_control, psc.mind, psc.p_style, psc.t_gofo, psc.mainball
from player_def d inner join (select
	num, name, p_position, era, inning, win, lose, save, hold,
	stamina,
	case
		when Inning <= 10 then '측정불가'
		when Stamina >= 100 then 'S'
		when Stamina >= 85 then 'A'
		when Stamina >= 63 then 'B'
		when Stamina >= 35 then 'C'
		else 'D'
		end as st_rank,
	b_speed,
	case
		when Inning <= 10 then '측정불가'
		when B_speed >= 90 then 'S'
		when B_speed >= 75 then 'A'
		when B_speed >= 57 then 'B'
		when B_speed >= 40 then 'C'
		else 'D'
	end as sp_rank,
	b_power,
	case
		when Inning <= 10 then '측정불가'
		when B_power >= 90 then 'S'
		when B_power >= 50 then 'A'
		when B_power >= 35 then 'B'
		when B_power >= 20 then 'C'
		else 'D'
	end as p_rank,
	command,
	case
		when Inning <= 10 then '측정불가'
		when Command >= 100 then 'S'
		when Command >= 86 then 'A'
		when Command >= 70 then 'B'
		when Command >= 55 then 'C'
		else 'D'
		end as c_rank,
	e_control,
	case
		when Inning <= 10 then '측정불가'
		when E_control >= 90 then 'S'
		when E_control >= 75 then 'A'
		when E_control >= 60 then 'B'
		when E_control >= 50 then 'C'
		else 'D'
		end as mind,
	case
		when P_pitch >= 52 then '파워피처'
		when P_pitch <= 31 then '맞춰잡는 투수'
		else '일반'
		end as p_style,
	t_gofo,
	mainball	
	from (select
		c.num as num,
		c.pname as name,
		c.pera as era,
		c.inning as inning,
		c.pwin as win,
		c.plose as lose,
		c.save as save,
		c.hold as hold,
		case
			when c.starting >= 11 then '선발'
			else '구원'
		end as p_position,
		case
			when c.inning <= 10 then 0
			when c.starting >= 11
			then round((s.ipg-2)*1000/47)
			else round(c.inning*10/9)
		end as stamina,
		case
			when c.inning <= 10 then 0
			when c.starting >= 11
			then round((s.fastball_s-125)*4)
			else round((s.fastball_s-120)*100/32)
		end as b_speed,
		case
			when c.inning <= 10 then 0
			else round(s.kbb*12.5)
		end as b_power,
		case
			when c.inning <= 10 then 0
			when bb9 = 0 then null
			else round(abs((bb9-10)*100/9))
		end as command,
		round((lob-38)*100/52) as e_control,
		round((s.pfr-0.5)*1000/16) as p_pitch,
		case
			when s.gofo > 1.118 then '땅볼유도형'
			else '뜬공유도형'
		end as t_gofo,
		case
			when greatest(s.fastball_v, s.slider_v, s.curve_v, s.changeup_v, s.spliter_v, s.sinker_v, s.knuckle_v, s.etc_v) = s.fastball_v then '직구'
			when greatest(s.fastball_v, s.slider_v, s.curve_v, s.changeup_v, s.spliter_v, s.sinker_v, s.knuckle_v, s.etc_v) = s.slider_v then '슬라이더'
			when greatest(s.fastball_v, s.slider_v, s.curve_v, s.changeup_v, s.spliter_v, s.sinker_v, s.knuckle_v, s.etc_v) = s.curve_v then '커브'
			when greatest(s.fastball_v, s.slider_v, s.curve_v, s.changeup_v, s.spliter_v, s.sinker_v, s.knuckle_v, s.etc_v) = s.changeup_v then '체인지업'
			when greatest(s.fastball_v, s.slider_v, s.curve_v, s.changeup_v, s.spliter_v, s.sinker_v, s.knuckle_v, s.etc_v) = s.spliter_v then '스플리터'
			when greatest(s.fastball_v, s.slider_v, s.curve_v, s.changeup_v, s.spliter_v, s.sinker_v, s.knuckle_v, s.etc_v) = s.sinker_v then '싱커'
			when greatest(s.fastball_v, s.slider_v, s.curve_v, s.changeup_v, s.spliter_v, s.sinker_v, s.knuckle_v, s.etc_v) = s.knuckle_v then '너클볼'
			when greatest(s.fastball_v, s.slider_v, s.curve_v, s.changeup_v, s.spliter_v, s.sinker_v, s.knuckle_v, s.etc_v) = s.etc_v then '기타'
		end as mainball
	from pstat_classic c inner join pstat_special s
	on c.pname = s.pname) as ps) psc
	on d.num = psc.Num ;
