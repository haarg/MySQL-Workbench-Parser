#!/usr/bin/perl

use strict;
use warnings;

use Test::More;

use File::Basename;
use File::Spec;

use_ok 'MySQL::Workbench::Parser';

my $mwb = File::Spec->catfile(
    dirname __FILE__,
    'test.mwb',
);

my $check = q|---
tables:
  -
    columns:
      -
        autoincrement: 0
        datatype: INT
        default_value: ''
        length: '-1'
        name: user_id
        not_null: 1
        precision: '-1'
    foreign_keys: {}
    name: tm_user
    primary_key:
      - user_id
  -
    columns:
      -
        autoincrement: 0
        datatype: INT
        default_value: ''
        length: '-1'
        name: speisen_id
        not_null: 1
        precision: '-1'
      -
        autoincrement: 0
        datatype: VARCHAR
        default_value: ''
        length: 45
        name: name
        not_null: 1
        precision: '-1'
      -
        autoincrement: 0
        datatype: DECIMAL
        default_value: ''
        length: '-1'
        name: speisencol
        not_null: 0
        precision: 10,0
      -
        autoincrement: 0
        datatype: VARCHAR
        default_value: ''
        length: 45
        name: speisencol1
        not_null: 0
        precision: '-1'
      -
        autoincrement: 0
        datatype: INT
        default_value: ''
        length: '-1'
        name: table1_id
        not_null: 1
        precision: '-1'
      -
        autoincrement: 0
        datatype: INT
        default_value: ''
        length: '-1'
        name: table1_id1
        not_null: 1
        precision: '-1'
    foreign_keys:
      table1:
        -
          foreign: table1_id
          me: table1_id
        -
          foreign: table1_id
          me: table1_id1
    name: speisen
    primary_key:
      - speisen_id
      - name
  -
    columns:
      -
        autoincrement: 0
        datatype: INT
        default_value: ''
        length: '-1'
        name: table1_id
        not_null: 1
        precision: '-1'
    foreign_keys: {}
    name: table1
    primary_key:
      - table1_id
|;

my $parser = MySQL::Workbench::Parser->new( file => $mwb );
is $parser->dump, $check;

done_testing();
