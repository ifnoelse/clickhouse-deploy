#!/usr/bin/env bash
clickhouse-client --host node-1 --query "CREATE TABLE user(userid UInt64,name String,sex String,age UInt8,create_date Date) ENGINE = MergeTree(create_date, (userid), 8192)"
clickhouse-client --host node-1 --query "CREATE TABLE user_all(userid UInt64,name String,sex String,age UInt8,create_date Date) ENGINE = Distributed(cluster1,'default','user', rand())"

clickhouse-client --host node-2 --query "CREATE TABLE user(userid UInt64,name String,sex String,age UInt8,create_date Date) ENGINE = MergeTree(create_date, (userid), 8192)"
clickhouse-client --host node-2 --query "CREATE TABLE user_all(userid UInt64,name String,sex String,age UInt8,create_date Date) ENGINE = Distributed(cluster1,'default','user', rand())"

clickhouse-client --host node-3 --query "CREATE TABLE user(userid UInt64,name String,sex String,age UInt8,create_date Date) ENGINE = MergeTree(create_date, (userid), 8192)"
clickhouse-client --host node-3 --query "CREATE TABLE user_all(userid UInt64,name String,sex String,age UInt8,create_date Date) ENGINE = Distributed(cluster1,'default','user', rand())"

clickhouse-client --host node-1 --query "INSERT INTO user_all FORMAT CSV" < user.csv

CREATE TABLE user(userid UInt64,name String,sex String,age UInt8,create_date Date) ENGINE = ReplicatedMergeTree('/clickhouse/tables/user','2',create_date, (userid), 8192)