drop table customer_order;
drop table supplies;
drop table sale;
drop table stock;
drop table cart;
drop table has_address;
drop table owns;
drop table grocery;
drop table fresh_produce;
drop table beverages;
drop table product;
drop table suppliers;
drop table market_space;
drop table warehouse;
drop table staff_member;
drop table address;
drop table card;
drop table customer;

create table address(
  address varchar(500),
  state varchar(2),
  primary key(address),
  address_type varchar(20) check(address_type in ('payment','delivery'))
);

create table card(
  id numeric(4),
  primary key(id)
);

create table customer(
  customer_name varchar(20),
  current_balance_due numeric(9,2),
  primary key(customer_name)
);

create table staff_member(
  staff_name varchar(20),
  address varchar(500),
  salary numeric(6),
  job_title varchar(20),
  primary key(staff_name)
);

create table warehouse(
  address varchar(500),
  capacity numeric(9),
  primary key(address)
);

create table market_space(
  state varchar(2),
  primary key(state)
);

create table suppliers(
  supplier_name varchar(20),
  address varchar(500),
  primary key(supplier_name,address)
);

create table product(
  pname varchar(20),
  ptype varchar(20),
  psize numeric(6),
  primary key(pname)
);

create table beverages(
  pname varchar(20),
  volume numeric(6),
  brand varchar(20),
  alcohol numeric(3,2),
  primary key (pname),
  foreign key (pname) references product on delete cascade
);

create table fresh_produce(
  pname varchar(20),
  package_place varchar(20),
  weight numeric(9,2),
  primary key (pname),
  foreign key (pname) references product on delete cascade
);

create table grocery(
  pname varchar(20),
  mfg_date DATE,
  exp_date DATE,
  primary key (pname),
  foreign key (pname) references product on delete cascade
);


create table owns(
  customer_name varchar(20),
  address varchar(500),
  id numeric(4),
  primary key(id, address, customer_name),
  foreign key (address) references address on delete cascade,
  foreign key (customer_name) references customer on delete cascade,
  foreign key (id) references card on delete cascade
);

create table has_address(
  customer_name varchar(20),
  address varchar(500),
  primary key(customer_name,address),
  foreign key (address) references address on delete cascade,
  foreign key(customer_name) references customer  on delete cascade
);

/* mistake in e-r diagram cart is n to n relation */

create table cart(
  pname varchar(20),
  customer_name varchar(20),
  quantity numeric(6),
  primary key (pname,customer_name),
  foreign key (pname) references product on delete cascade,
  foreign key (customer_name) references customer on delete cascade
);

create table stock(
  address varchar(500),
  pname varchar(20),
  units numeric(10),
  primary key (address,pname),
  foreign key (address) references warehouse on delete cascade,
  foreign key (pname) references product on delete cascade
);

create table sale(
  state varchar(2),
  pname varchar(20),
  price numeric(9,2),
  primary key (state,pname),
  foreign key (state) references market_space on delete cascade,
  foreign key (pname) references product on delete cascade
);

/* relation suppliers form e-r is renamed supplies */

create table supplies(
  supplier_name varchar(20),
  address varchar(500),
  pname varchar(20),
  supplier_price numeric(9,2),
  primary key (supplier_name,address,pname),
  foreign key(supplier_name,address) references suppliers on delete cascade,
  foreign key (pname) references product on delete cascade
);

create table customer_order(
  id numeric(4),
  pname varchar(20),
  quantity numeric(6),
  issue_date DATE,
  status varchar(20) check(status in ('issued','send','recived')),
  primary key (id,pname),
  foreign key (pname) references product on delete cascade,
  foreign key (id) references card on delete cascade
);

/* most indexing is already done base on primary key selection;
how ever a coustmer would mostly query to display products of given type*/
CREATE INDEX ProductIndex
ON Product (Ptype,pname)
compute statistics ;
/* notice change order*/

/*sales have to frequently update flucating product price
already as primary key

CREATE INDEX saleIndex
ON sale (state,pname)
compute statistics ;
*/
/* stock needs to be reguarly updated
already as primary key

CREATE INDEX stockIndex
ON stock (address,pname)
compute statistics ;
*/

/* order is reguraly quried by both customer and staff for updates*/
CREATE INDEX orderIndex
ON customer_order (id,pname,status)
compute statistics ;

commit;


