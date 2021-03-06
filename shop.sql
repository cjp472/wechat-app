create table tp_banner(
    id int not null primary key auto_increment,
    image varchar(512) not null default '' comment '图片地址',
    product_id int not null default '0' comment '关联产品',
    position tinyint not null default '1' comment '排序',
    enabled enum('Y','N') not null default 'Y' comment '是否可用，默认是',
    create_time int not null default '0' comment '创建时间',
    update_time int not null default '0' comment '修改时间'
)engine=innodb default charset='utf8' comment='轮播图';

create table tp_category(
    id int not null primary key auto_increment,
    image varchar(512) not null default '' comment '图片地址',
    name varchar(16) not null default '0' comment '分类名称',
    position tinyint not null default '1' comment '排序',
    enabled enum('Y','N') not null default 'Y' comment '是否可用，默认是',
    create_time int not null default '0' comment '创建时间',
    update_time int not null default '0' comment '修改时间'
)engine=innodb default charset='utf8' comment='分类表';


create table tp_product(
    id int not null primary key auto_increment,
    category_id int not null default '0' comment '关联产品ID',
    image varchar(512) not null default '' comment '图片地址',
    name varchar(255) not null default '' comment '产品标题',
    description varchar(512) not null default '' comment '产品简单介绍',
    price decimal(10,2) not null default '0.00' comment '产品价格',
    origin_price decimal(10,2) not null default '0.00' comment '产品原价格',
    sales int not null default '0' comment '产品销量',
    fade_sales int not null default '0' comment '产品虚假销量',
    hots int not null default '1' comment '产品热度：越大排序越靠前',
    attr varchar(32) not null default '' comment '产品属性名称：如颜色分类，尺码等',
    stock int not null default '0' comment 'SKU库存',
    integral int not null DEFAULT '0' comment '积分',
    content text not null comment '产品内容',
    online enum('Y','N') not null default 'Y' comment '是否上架，Y是',
    enabled enum('Y','N') not null default 'Y' comment '是否可用，默认是',
    create_time int not null default '0' comment '创建时间',
    update_time int not null default '0' comment '修改时间'
)engine=innodb default charset='utf8' comment='产品表';

create table tp_product_sku(
    id int not null primary key auto_increment,
    product_id int not null default '0' comment '产品ID',
    attr varchar(32) not null DEFAULT '' comment 'sku名称',
    price decimal(10,2) not null default '0.00' comment 'sku金额',
    stock int not null default '0' comment 'SKU库存',
    enabled enum('Y','N') not null default 'Y' comment '是否可用，默认是',
    create_time int not null default '0' comment '创建时间',
    update_time int not null default '0' comment '修改时间'
)engine=innodb default charset='utf8' comment='产品sku表';

create table tp_product_comment(
    id int not null primary key auto_increment,
    product_id int not null default '0' comment '关联产品',
    order_id int not null default '0' comment '关联订单',
    user_id int not null default '0' comment '用户uid',
    content text not null comment '评论内容',
    enabled enum('Y','N') not null default 'Y' comment '是否可用，默认是',
    create_time int not null default '0' comment '创建时间',
    update_time int not null default '0' comment '修改时间'
)engine=innodb default charset='utf8' comment='产品评论表';

create table tp_order(
    id int not null primary key auto_increment,
    user_id int not null default '0' comment '用户uid',
    order_sn varchar(20) not null default '' comment '订单号',
    price decimal(10,2) not null default '0.00' comment '订单金额',
    trade_no varchar(32) not null default '' comment '交易单号',
    pay_price decimal(10,2) not null default '0.00' comment '支付金额',
    pay_time int not null default '0' comment '支付时间',
    status tinyint not null default '0' comment '订单状态：0待支付，10已支付，20支付失败，30已发货，40已收货，50完成，60申请退款，70退款中，80已退款，90已关闭',
    express varchar(32) not null DEFAULT '' comment '快递',
    express_no VARCHAR(32) not null DEFAULT '' comment '快递单号',
    express_json varchar(2048) not NULL DEFAULT '' comment '物流信息',
    integral int not null DEFAULT '0' comment '积分',
    enabled enum('Y','N') not null default 'Y' comment '是否可用，默认是',
    create_time int not null default '0' comment '创建时间',
    update_time int not null default '0' comment '修改时间'
)engine=innodb default charset='utf8' comment='轮播图';

create table tp_order_detail(
    id int not null primary key auto_increment,
    order_id int not null default '0',
    product_id int not null default '0' comment '产品ID',
    sku_id int not null default '0' comment '产品sku ID',
    product_name varchar(32) not null DEFAULT '' comment '产品名称',
    product_image VARCHAR(512) not null DEFAULT '' comment '图片地址',
    product_attr varchar(512) not null default '' comment '产品属性',
    product_price decimal(10,2) not null default '0.00' comment '产品金额',
    product_num decimal(10,2) not null default '0.00' comment '购买数量',
    product_content text not null comment '产品内容',
    create_time int not null default '0' comment '创建时间',
    update_time int not null default '0' comment '修改时间'
)engine=innodb default charset='utf8' comment='订单详情';

create table tp_order_address(
    id int not null primary key auto_increment,
    order_id int not null default '0',
    username varchar(32) not null DEFAULT '' comment '联系人',
    telephone char(11) not NULL DEFAULT '' comment '联系电话',
   province varchar(16) not null DEFAULT  '' comment '省',
    city varchar(16) not null DEFAULT  '' comment '市',
    area varchar(16) not null default '' comment '区',
    address varchar(255) not null default '' comment '详细地址',
    create_time int not null default '0' comment '创建时间',
    update_time int not null default '0' comment '修改时间'
)engine=innodb default charset='utf8' comment='订单地址表';

create table tp_order_refund(
    id int not null primary key auto_increment,
    order_id int not null default '0' comment '退款订单',
    refund_sn varchar(20) not null DEFAULT '' comment '退款单号',
    refund_price decimal(10,2) not null default '0.00' comment '退款金额',
    status tinyint not null default '100' comment '退款状态：100申请退款，110 拒绝退款，120同意退款，130待收货，140确认收货，150已退款',
    express varchar(32) not null DEFAULT '0' comment '快递',
    express_no VARCHAR(32) not null DEFAULT '' comment '快递单号',
    express_json varchar(2048) not NULL DEFAULT '' comment '物流信息',
    reason VARCHAR(255) not null DEFAULT '' comment '退款原因',
    reason_images VARCHAR(1024) not null DEFAULT '' comment '退款原因:图片数组json存储',
    enabled enum('Y','N') not null default 'Y' comment '是否可用，默认是',
    create_time int not null default '0' comment '创建时间',
    update_time int not null default '0' comment '修改时间'
)engine=innodb default charset='utf8' comment='订单退款';

create table tp_express(
    id int not null primary key auto_increment,
    name varchar(32) not null default '' comment '快递名称',
    enabled enum('Y','N') not null default 'Y' comment '是否可用，默认是',
    create_time int not null default '0' comment '创建时间',
    update_time int not null default '0' comment '修改时间'
)engine=innodb default charset='utf8' comment='快递表';

create table tp_user_address(
    id int not null primary key auto_increment,
    username varchar(32) not null DEFAULT '' comment '联系人',
    telephone char(11) not NULL DEFAULT '' comment '联系电话',
    province_id int not null default '0' comment '省',
    city_id int not null default '0' comment '市',
    area_id int not null default '0' comment '区',
    address varchar(255) not null default '' comment '详细地址',
    is_default enum('Y', 'N') not null DEFAULT 'N' comment '默认地址：N否',
    enabled enum('Y','N') not null default 'Y' comment '是否可用，默认是',
    create_time int not null default '0' comment '创建时间',
    update_time int not null default '0' comment '修改时间'
)engine=innodb default charset='utf8' comment='用户地址';

create table tp_cart(
    id int not null primary key auto_increment,
    user_id int not null DEFAULT '0' comment '用户ID',
    product_id int not null DEFAULT '0' comment '产品ID',
    sku_id int not null DEFAULT '0' comment 'SKU ID',
    num decimal(10,2) not null default '0.00' comment '购买数量',
    selected enum('Y','N') not null default 'Y' comment '是否选中：是',
    enabled enum('Y','N') not null default 'Y' comment '是否可用，默认是',
    create_time int not null default '0' comment '创建时间',
    update_time int not null default '0' comment '修改时间'
)engine=innodb default charset='utf8' comment='购物车';

create table tp_user(
    id int not null primary key auto_increment,
    integral int not null DEFAULT '0' comment '积分',
    username varchar(32) not null DEFAULT '' comment '用户名' ,
    openid varchar(64) not NULL  DEFAULT  '' comment '用户标识',
    unionid varchar(64) not NULL  DEFAULT  '' comment '用户unionid',
    avatar varchar(512) not null default '' comment '用户头像',
    telephone char(11) not null DEFAULT  '' comment '手机号',
    province varchar(16) not null DEFAULT  '' comment '省',
    city varchar(16) not null DEFAULT  '' comment '市',
    country varchar(16) not null DEFAULT  '' comment '国家',
    gender varchar(4) not null DEFAULT '' comment '性别',
    enabled enum('Y','N') not null default 'Y' comment '是否可用，默认是',
    create_time int not null default '0' comment '创建时间',
    update_time int not null default '0' comment '修改时间'
)engine=innodb default charset='utf8' comment='用户表';

create table tp_config(
    id int not null primary key auto_increment,
    keyword varchar(32) not null default '' comment '配置项',
    value varchar(32) not null default '' comment '配置值',
    enabled enum('Y','N') not null default 'Y' comment '是否可用，默认是',
    create_time int not null default '0' comment '创建时间',
    update_time int not null default '0' comment '修改时间'
)engine=innodb default charset='utf8' comment='配置表';

create table tp_statistics(
    id int not null primary key auto_increment,
    date varchar(32) not null default '' comment '统计日期',
    orders int not null default '0' comment '订单数',
    users int not null default '0' comment '用户数',
    products int not null default '0' comment '产品数',
    amounts decimal(10,2) not null default '0.00' comment '收入数',
    create_time int not null default '0' comment '创建时间',
    update_time int not null default '0' comment '修改时间'
)engine=innodb default charset='utf8' comment='统计表';

create table tp_company_account(
    id int not null primary key auto_increment,
    telephone char(11) not null DEFAULT '' comment '联系手机',
    company varchar(64) not null default '' comment '公司名称',
    username varchar(16) not null DEFAULT '' comment '联系用户',
    amount  decimal(10,2) not null DEFAULT '0.00' comment '花费金额，元',
    freeze  decimal(10,2) not null DEFAULT '0.00' comment '冻结金额，元',
    create_time int not null default '0' comment '创建时间',
    update_time int not null default '0' comment '修改时间'
)engine=innodb default charset='utf8' comment='账户余额';

create table tp_consume_log(
    id int not null primary key auto_increment,
    order_id int not null DEFAULT '0' comment '订单ID',
    amount decimal(10,2) not null DEFAULT '0.00' comment '消费金额，元',
    consume enum('SMS', 'EXP') NOT NULL DEFAULT 'SMS' comment '消费项目：短信，快递查询',
    remark varchar(255) not null DEFAULT '' comment '说明',
    create_time int not null default '0' comment '创建时间',
    update_time int not null default '0' comment '修改时间'
)engine=innodb default charset='utf8' comment='消费日志';

create table tp_company_config(
    id int not null primary key auto_increment,
    username varchar(64) not null DEFAULT '' comment '联系人',
    telephone char(11) not NULL DEFAULT '' comment '联系电话',
    address varchar(255) not null default '' comment '详细地址',
    delivery varchar(255) not NULL DEFAULT '' comment '配送方式：express快递，O2O 到店自提 逗号拼接',
    express enum('FREE', 'FEE') NOT NULL  DEFAULT 'FREE' comment '快递费用：包邮，固定邮费',
    open_time varchar(255) not NULL  DEFAULT '' comment '到店自提：营业开始时间',
    close_time varchar(255) not NULL  DEFAULT '' comment '到店自提：营业结束时间',
    express_fee decimal(10,2) not NULL DEFAULT '0' comment '固定邮费金额',
    express_integral enum('Y', 'N') not NULL DEFAULT 'N' comment '是否启动积分抵扣邮费',
    integral_yuan int not NULL DEFAULT '100' comment '多少积分抵扣1元邮费',
    remark varchar(255) not null default '' comment '其他说明',
    create_time int not null default '0' comment '创建时间',
    update_time int not null default '0' comment '修改时间'
)engine=innodb default charset='utf8' comment='公司';

INSERT INTO `wechat-app`.`tp_admin_node` (`id`, `pid`, `group_id`, `name`, `title`, `remark`, `level`, `type`, `sort`, `status`, `isdelete`) VALUES ('71', '1', '5', 'ProductComment', '用户评价', '', '2', '1', '50', '1', '0');
INSERT INTO `wechat-app`.`tp_admin_node` (`id`, `pid`, `group_id`, `name`, `title`, `remark`, `level`, `type`, `sort`, `status`, `isdelete`) VALUES ('72', '1', '1', 'CompanyAccount', '账户管理', '', '2', '1', '50', '1', '0');
INSERT INTO `wechat-app`.`tp_admin_node` (`id`, `pid`, `group_id`, `name`, `title`, `remark`, `level`, `type`, `sort`, `status`, `isdelete`) VALUES ('73', '1', '1', 'ConsumeLog', '消费记录', '', '2', '1', '50', '1', '0');
INSERT INTO `wechat-app`.`tp_admin_node` (`id`, `pid`, `group_id`, `name`, `title`, `remark`, `level`, `type`, `sort`, `status`, `isdelete`) VALUES ('74', '1', '1', 'CompanyAddress', '退货信息', '', '2', '1', '50', '1', '0');
INSERT INTO `wechat-app`.`tp_admin_node` (`id`, `pid`, `group_id`, `name`, `title`, `remark`, `level`, `type`, `sort`, `status`, `isdelete`) VALUES ('75', '1', '1', 'CompanyConfig', '下单配置', '', '2', '1', '50', '1', '0');
