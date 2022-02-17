function gen_stamps_format_cnr(snapping_file)
%snapping_file=snappingpsiLosAngeles20172021.csv;
%infile1=importdata(snapping_file);
%infile1='snappingpsiLosAngeles20172021';
date = ['2017-06-20'; '2017-07-26'; '2017-08-31'; '2017-09-24'; '2017-10-30'; '2017-11-23'; '2017-12-29'; '2018-01-22'; '2018-02-27'; '2018-03-23'; '2018-04-28'; '2018-05-22'; '2018-06-27'; '2018-07-21'; '2018-08-26'; '2018-09-19'; '2018-10-25'; '2018-11-30'; '2018-12-24'; '2019-01-29'; '2019-02-22'; '2019-03-30'; '2019-04-23'; '2019-05-29'; '2019-06-22'; '2019-07-28'; '2019-08-21'; '2019-09-26'; '2019-10-20'; '2019-11-25'; '2019-12-31'; '2020-01-24'; '2020-02-29'; '2020-03-24'; '2020-04-29'; '2020-05-23'; '2020-06-28'; '2020-07-22'; '2020-08-15'; '2020-09-20'; '2020-10-26'; '2020-11-19'; '2020-12-25'];
	
infile=csvread(snapping_file,43,1);
%date=(table2array(snapping_file(17,7:size(snapping_file,2))));
%date1=string(date);
% 2020-08-14T17:37:13Z, 2020-08-26T17:37:14Z, 2020-09-07T17:37:14Z, 2020-09-19T17:37:15Z, 2020-10-01T17:37:15Z, 2020-10-13T17:37:15Z, 2020-10-25T17:37:15Z, 2020-11-06T17:37:15Z, 2020-11-18T17:37:15Z, 2020-11-30T17:37:14Z, 2020-12-12T17:37:14Z, 2020-12-24T17:37:13Z, 2021-01-05T17:37:13Z, 2021-01-17T17:37:12Z, 2021-01-29T17:37:12Z, 2021-02-10T17:37:12Z, 2021-02-22T17:37:11Z, 2021-03-18T17:37:11Z, 2021-03-30T17:37:11Z, 2021-04-11T17:37:12Z, 2021-04-23T17:37:13Z, 2021-05-05T17:37:13Z, 2021-05-17T17:37:14Z, 2021-05-29T17:37:14Z, 2021-06-10T17:37:15Z, 2021-06-22T17:37:16Z, 2021-07-04T17:37:17Z, 2021-07-16T17:37:17Z, 2021-07-28T17:37:18Z, 2021-08-09T17:37:19Z, 2021-08-21T17:37:19Z

day=datenum(date);%,'yyyymmdd');
%infile1=table2array(infile1(18:size(infile1,1),:));
%infile1=load('snapping_losangeles.mat');
%infile=infile1.aa;
infile=csvread(snapping_file,43,1);
%date=(table2array(snapping_file(17,7:size(snapping_file,2))));
%date1=string(date);
% 2020-08-14T17:37:13Z, 2020-08-26T17:37:14Z, 2020-09-07T17:37:14Z, 2020-09-19T17:37:15Z, 2020-10-01T17:37:15Z, 2020-10-13T17:37:15Z, 2020-10-25T17:37:15Z, 2020-11-06T17:37:15Z, 2020-11-18T17:37:15Z, 2020-11-30T17:37:14Z, 2020-12-12T17:37:14Z, 2020-12-24T17:37:13Z, 2021-01-05T17:37:13Z, 2021-01-17T17:37:12Z, 2021-01-29T17:37:12Z, 2021-02-10T17:37:12Z, 2021-02-22T17:37:11Z, 2021-03-18T17:37:11Z, 2021-03-30T17:37:11Z, 2021-04-11T17:37:12Z, 2021-04-23T17:37:13Z, 2021-05-05T17:37:13Z, 2021-05-17T17:37:14Z, 2021-05-29T17:37:14Z, 2021-06-10T17:37:15Z, 2021-06-22T17:37:16Z, 2021-07-04T17:37:17Z, 2021-07-16T17:37:17Z, 2021-07-28T17:37:18Z, 2021-08-09T17:37:19Z, 2021-08-21T17:37:19Z

day=datenum(date);%,'yyyymmdd');
%infile1=table2array(infile1(18:size(infile1,1),:));
%infile1=load('snapping_losangeles.mat');
%infile=infile1.aa;
disp=infile(:,9:size(infile,2));
%infile=table2array(disp);
%infile = csvread(snapping_file,17,1);
psver = 2;
% Generate compatible StaMPS files
% Generate psver
save 'psver.mat' 'psver'
% Generate ps2
clear psver
lonlat(:,1)=infile(:,2);
lonlat(:,2)=infile(:,1);
ll=size(disp,2);
bperp=ones(ll,1);
calconst=ones(ll-1,1);

master_ix   = 1;
master_day  = day(master_ix);
n_ifg       = ll;%size(infile,2)-6;
day_ix      = ll-1;%1:size(infile,2)-7;
n_image     = ll;%size(infile,2)-6;

xy(:,1)=1:size(infile,1);
xy(:,2)=1;
xy(:,3)=1;
vel=infile(:,4);
unit_vect(:,1)=infile(:,6);% north
unit_vect(:,2)=infile(:,7);% east
unit_vect(:,3)=infile(:,8);%up
inc=atan2(unit_vect(:,3),(sqrt(unit_vect(:,2).^2 + unit_vect(:,1).^2)));%% incidence
heading = atan2(unit_vect(:,1),unit_vect(:,2));%heading
n_ps=size(infile,1);% number of ps points
disp=infile(:,9:size(infile,2));
ph_uw=(-1.*disp*(4*pi))/5.5466;
ph=angle(exp(1i.*ph_uw));
hgt(:,1)=infile(:,3);
save 'hgt2.mat' 'hgt'
save 'ph2.mat' 'ph'
save 'phuw2.mat'  'ph_uw'
save 'inc2.mat'  'inc'
save 'ps2.mat' 'lonlat' 'bperp' 'calconst' 'day' 'n_ps'  'master_ix' 'master_day' 'n_ifg' 'day_ix' 'n_image' 'xy'
save 'heading.mat' 'heading'
end