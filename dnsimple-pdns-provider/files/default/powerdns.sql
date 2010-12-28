create table domains (
  id                INTEGER PRIMARY KEY,
  name              VARCHAR(255) NOT NULL,
  master            VARCHAR(128) DEFAULT NULL,
  last_check        INTEGER DEFAULT NULL,
  type              VARCHAR(6) NOT NULL,
  notified_serial   INTEGER DEFAULT NULL, 
  account           VARCHAR(40) DEFAULT NULL
);

create unique index name_index on domains(name);

create table records (
  id              INTEGER PRIMARY KEY,
  domain_id       INTEGER DEFAULT NULL,
  name            VARCHAR(255) DEFAULT NULL,
  type            VARCHAR(6) DEFAULT NULL,
  content         VARCHAR(255) DEFAULT NULL,
  ttl             INTEGER DEFAULT NULL,
  prio            INTEGER DEFAULT NULL,
  change_date     INTEGER DEFAULT NULL
);

create index rec_name_index on records(name);
create index nametype_index on records(name,type);
create index domain_id on records(domain_id);

create table supermasters (
  ip          VARCHAR(25) NOT NULL, 
  nameserver  VARCHAR(255) NOT NULL, 
  account     VARCHAR(40) DEFAULT NULL
);
