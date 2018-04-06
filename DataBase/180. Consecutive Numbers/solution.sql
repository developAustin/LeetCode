select DISTINCT ConsecutiveNums from (
    select case when @preNum = num then @count:=@count+1 else @count:=1 end,case when @count >= 3 then num else null end as ConsecutiveNums,@preNum:=num
from Logs,(select @count:=1,@preNum:=null) a
) b where ConsecutiveNums is not null
;