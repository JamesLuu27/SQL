--Basic SQL Commands 
--Selects, group, having, asc, desc
select inv_number, sum(line_units * line_price as total
from line
group by inv_number
having sum(line_units * line_price) > 100
ORDER BY DESC;
GO

-- nvl, decode, case
select price, order_number, nvl(order_number, '99999')
from product;
GO


select v_name, v_state, decode(v_state, 'FL', 'Florida', 'GA', 'Georgia', 'Other') as "State",
CASE v_state
when 'FL' THEN 'FLORIDA'
WHEN 'GA' THEN 'GEORGIA'
WHEN 'TN' THEN 'TENNESSEE'
ELSE 'OTHER'
END
AS "STATE"
FROM VENDOR;
GO

--PROMPT, ACCEPT, SEQUENCE, DEFINE, AMPERSANDS
PROMPT ********Receive Order Screen*********
PROMPT 
SELECT 'DATE', SYSDATE FROM DUAL;
PROMPT

DEFINE warning = 'ORDER NOT FOUND!! RERUN THE PROGRAM!!'
DEFINE v_part_num = 'N/A'
DEFINE v_part_description = 'N/A'

ACCEPT v_ord_num NUMBER FORMAT 9999 PROMPT "Enter Order Number to Receive"
FROM ord o INNER JOIN part p ON o.part_num = p.part_num
WHERE ord_num = &v_ord_num;