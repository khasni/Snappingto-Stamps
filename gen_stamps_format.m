function gen_stamps_format(snapping_file)
%snapping_file=snappingpsiLosAngeles20172021.csv;
%infile1=importdata(snapping_file);
%infile1='snappingpsiLosAngeles20172021';
date=(table2array(snapping_file(17,7:size(snapping_file,2))));
date1=string(date);
day=datenum(date1,'yyyymmdd');
%infile1=table2array(infile1(18:size(infile1,1),:));
%infile1=load('snapping_losangeles.mat');
%infile=infile1.aa;
disp=snapping_file(18:size(snapping_file,1),:);
infile=table2array(disp);
%infile = csvread(snapping_file,17,1);
psver = 2;
% Generate compatible StaMPS files
% Generate psver
save 'psver.mat' 'psversion'
% Generate ps2
clear psversion
lonlat(:,1)=infile(:,3);
lonlat(:,2)=infile(:,2);
l1=size(infile,2);
bperp=ones(l1,1);
calconst=ones(l1-1,1);

master_ix   = 10;
master_day  = day(master_ix);
n_ifg       = size(infile,2)-6;
day_ix      = 1:size(infile,2)-7;
n_image     = size(infile,2)-6;

xy(:,1)=1:size(infile,1);
xy(:,2)=1;
xy(:,3)=1;
incidence=infile(:,6);
n_ps=size(infile,1);
disp=infile(:,7:size(infile,2));
ph_uw=(disp*(4*pi))/55.466;
ph=angle(exp(1i.*ph_uw));

save 'ph2.mat' 'ph'
save 'phuw2.mat'  'ph_uw'
save 'inc2.mat'  'incidence'
save 'ps2.mat' 'lonlat' 'bperp' 'calconst' 'day' 'n_ps'  'master_ix' 'master_day' 'n_ifg' 'day_ix' 'n_image' 'xy'
end