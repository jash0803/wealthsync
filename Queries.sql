-- Q1) How much quantity of each stock type do the users own
select p.user_id,s.stock_type,sum(p.quantity_owned) as quantity from stock as s 
join contains_stock as cs on s.stock_symbol=cs.stock_symbol 
join portfolio as p on cs.portfolio_id=p.portfolio_id
group by p.user_id,s.stock_type
order by user_id asc;


-- Q2) Give all the stocks User 2 owns
select p.user_id,s.stock_name from portfolio as p 
join contains_stock as c 
on p.portfolio_id=c.portfolio_id 
join stock as s 
on c.stock_symbol=s.stock_symbol
where p.user_id='2';


-- Q3) create a view to give the total net worth of the portfolio of all users owns according to commodities
create view networth as 
select user_id,portfolio_type,sum(purchased_price*quantity_owned) as net_worth 
from portfolio  
group by portfolio_type,user_id 
order by user_id asc;

select * from networth

-- Q4) Give all the commodities user 1 owns
select p.user_id,c.commodity_name from portfolio as p
join contains_commodity as s 
on p.portfolio_id=s.portfolio_id
join commodity as c
on c.commodity_name=s.commodity_name
where p.user_id = '1';


-- Q5)Give the current news for the stock 'State bank of india'
select n.news_title,s.stock_name from news as n join stock as s on n.stock_symbol=s.stock_symbol where s.stock_symbol='SBI';


-- Q6)Query to change the password of a particular user
update login set login_password='WXYZ3456YZ' where login_id='013'


-- Q7)User 2 has sold one of his stock('infy') so update the portfolio
delete from portfolio where portfolio_id='2' and user_id='1';


-- Q8)User has got a new bank account numeber 
update users set bank_acc_number='1446987543421765' where user_id='8';


-- Q9)Give the stocks whose openeing price is greater than
select * from stock where opening_price>1000;


-- Q10)Give the currency exchange rate for the Dirham
select * from currency where currency_symbol='AED';


-- Q11)How much quantities of stock do various users own ?
select user_id,sum(quantity_owned) as quantity_of_stocks from portfolio group by user_id ;


-- Q12) Give all the news that the author "Emily Wilson" has written
select * from news where author='Emily Wilson';


-- Q13) Give the users who have born in the year 2003
select * from users where EXTRACT(YEAR FROM dob) = '2003'


-- Q14) User 1 has to favourite the stock 'RELIANCE'
update favourite set status='TRUE' 
where stock_symbol='RELIANCE' and user_id='001';


-- Q15) Give the stocks which have their stock_gain_loss above or 30
select * FROM stock where stock_gain_loss>='30';


-- Q16)Give the index names of all the stocks
select i.index_name,s.stock_symbol,s.stock_name from stock_indices as i join 
stock as s on i.index_symbol=s.index_symbol ;


-- Q17)Give the user_name and login passwords of various users
select u.user_id,u.user_name,l.login_password from users as u join login as l on u.user_id=l.login_id;


-- Q18)Give the news of a particular stock_symbol
select news_title,news_source,stock_symbol from news where stock_symbol='LT';


-- Q19)Give the number of all commodity types 
select count(commodity_name),commodity_type from commodity group by commodity_type;


-- Q20)Total net worth of all the stocks indices
select sum(stock_price),index_symbol from stock group by index_symbol;
