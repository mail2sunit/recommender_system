function restaurant_list = loadrest()
fid = fopen('restaurant_list.txt');
n = 55;
restaurant_list = cell(n,1);
for i=1:n
line = fgets(fid);
restname = strtok(line, '\t');
restaurant_list{i} = strtrim(restname);
end
fclose(fid);
end