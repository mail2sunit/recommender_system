function varargout = new_user(varargin)
% NEW_USER MATLAB code for new_user.fig
%      NEW_USER, by itself, creates a new NEW_USER or raises the existing
%      singleton*.
%
%      H = NEW_USER returns the handle to a new NEW_USER or the handle to
%      the existing singleton*.
%
%      NEW_USER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in NEW_USER.M with the given input arguments.
%
%      NEW_USER('Property','Value',...) creates a new NEW_USER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before new_user_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to new_user_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help new_user

% Last Modified by GUIDE v2.5 01-Jul-2015 11:04:43

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @new_user_OpeningFcn, ...
                   'gui_OutputFcn',  @new_user_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before new_user is made visible.
function new_user_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to new_user (see VARARGIN)

% Choose default command line output for new_user
handles.output = hObject;
% Update handles structure
guidata(hObject, handles);

ha = axes('units','normalized', ...
            'position',[0 0 1 1]);
uistack(ha,'bottom');
I=imread('new_user2.jpg');
hi = imagesc(I);
colormap gray
set(ha,'handlevisibility','off', ...
            'visible','off')


% --- Outputs from this function are returned to the command line.
function varargout = new_user_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in preference.
function preference_Callback(hObject, eventdata, handles)
% hObject    handle to preference (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns preference contents as cell array
%        contents{get(hObject,'Value')} returns selected item from preference
a = get(handles.preference,'Value');
data = getappdata(0,'HandleMainGUI');
switch a
    case 1
        data.user_theta(1) = 1;
    case 2
        data.user_theta(2) = 1;
end
setappdata(0,'HandleMainGUI',data);

% --- Executes during object creation, after setting all properties.
function preference_CreateFcn(hObject, eventdata, handles)
% hObject    handle to preference (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in cuisine.
function cuisine_Callback(hObject, eventdata, handles)
% hObject    handle to cuisine (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns cuisine contents as cell array
%        contents{get(hObject,'Value')} returns selected item from cuisine
a = get(handles.cuisine,'Value');
data = getappdata(0,'HandleMainGUI');
switch a
    case 1
        data.user_theta(3) = 1;
    case 2
        data.user_theta(4) = 1;
    case 3
        data.user_theta(5) = 1;
    case 4
        data.user_theta(6) = 1;
end
setappdata(0,'HandleMainGUI',data);

% --- Executes during object creation, after setting all properties.
function cuisine_CreateFcn(hObject, eventdata, handles)
% hObject    handle to cuisine (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in budget.
function budget_Callback(hObject, eventdata, handles)
% hObject    handle to budget (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns budget contents as cell array
%        contents{get(hObject,'Value')} returns selected item from budget
a = get(handles.budget,'Value');
data = getappdata(0,'HandleMainGUI');
switch a
    case 1
        data.user_theta(7) = 1;
    case 2
        data.user_theta(8) = 1;
        data.user_theta(7) = 1;
    case 3
        data.user_theta(9) = 1;
        data.user_theta(8) = 1;
        data.user_theta(7) = 1;
end
setappdata(0,'HandleMainGUI',data);


% --- Executes during object creation, after setting all properties.
function budget_CreateFcn(hObject, eventdata, handles)
% hObject    handle to budget (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in smoking.
function smoking_Callback(hObject, eventdata, handles)
% hObject    handle to smoking (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns smoking contents as cell array
%        contents{get(hObject,'Value')} returns selected item from smoking
a = get(handles.smoking,'Value');
data = getappdata(0,'HandleMainGUI');
switch a 
    case 1
        data.user_theta(10) = 1;
    case 2
        data.user_theta(11) = 1;
end
setappdata(0,'HandleMainGUI',data);

% --- Executes during object creation, after setting all properties.
function smoking_CreateFcn(hObject, eventdata, handles)
% hObject    handle to smoking (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in drinking.
function drinking_Callback(hObject, eventdata, handles)
% hObject    handle to drinking (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns drinking contents as cell array
%        contents{get(hObject,'Value')} returns selected item from drinking
a = get(handles.drinking,'Value');
data = getappdata(0,'HandleMainGUI');
switch a
    case 1
        data.user_theta(12) = 1;
    case 2
        data.user_theta(13) = 1;
    case 3
        data.user_theta(14) = 1;
end
setappdata(0,'HandleMainGUI',data);

% --- Executes during object creation, after setting all properties.
function drinking_CreateFcn(hObject, eventdata, handles)
% hObject    handle to drinking (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
data = getappdata(0,'HandleMainGUI');
data.user_theta
setappdata(0,'HandleMainGUI',data);
content_based(hObject, handles, data);
close(handles.new_user);


function content_based(hObject, handles, data)
data.user_theta;
arr = [0,2,6,9,11,14];
load ('res_feature_matrix.mat');
n = size(res_feature_matrix,1);
content_matrix = zeros(size(res_feature_matrix));
for i=1:n
    content_matrix(i,:) = (data.user_theta).*(res_feature_matrix(i,:));
end
assignin('base','content_matrix',content_matrix);
assignin('base','data_user_theta',data.user_theta);
predictions = zeros(1,size(res_feature_matrix,1));
for i=1:n
    k=0;
    avg = 0;
    for j=1:length(arr)-1
        x= sum(content_matrix(i,arr(j)+1:arr(j+1)));
        y= sum(data.user_theta(arr(j)+1:arr(j+1)));
        if y==0
            avg = avg/(k+1);
            k=k+1;
        else
            sum_avg = (x*5)/y;
            avg = ((avg*k)+sum_avg)/(k+1);
            k=k+1;
        end
    end
    predictions(i) = avg;
end
assignin('base','predictions',predictions);
[r, ix] = sort(predictions,'descend');
restaurant_list = loadrest();
%for k=1:20
 %   fprintf('\n %s rating %f',restaurant_list{ix(k)}, r(k));
%end
data.ix = ix;
data.r = r;
setappdata(0,'HandleMainGUI',data);
run user_predict;
data.user_theta = zeros(1,14);
setappdata(0,'HandleMainGUI',data);
