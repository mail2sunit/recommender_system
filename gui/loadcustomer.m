function customer_list = loadcustomer()
fid = fopen('customer_list.txt');
n = 193;
customer_list = cell(n,1);
for i=1:n
line = fgets(fid);
customer_name = strtok(line,'\t');
customer_list{i} = strtrim(customer_name);
end
fclose(fid);
end