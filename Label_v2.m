function varargout = Label_v2(varargin)
% LABEL_V2 MATLAB code for Label_v2.fig
%      LABEL_V2, by itself, creates a new LABEL_V2 or raises the existing
%      singleton*.
%
%      H = LABEL_V2 returns the handle to a new LABEL_V2 or the handle to
%      the existing singleton*.
%
%      LABEL_V2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LABEL_V2.M with the given input arguments.
%
%      LABEL_V2('Property','Value',...) creates a new LABEL_V2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Label_v2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Label_v2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Label_v2

% Last Modified by GUIDE v2.5 14-Dec-2017 17:51:32

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Label_v2_OpeningFcn, ...
                   'gui_OutputFcn',  @Label_v2_OutputFcn, ...
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


% --- Executes just before Label_v2 is made visible.
function Label_v2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Label_v2 (see VARARGIN)
addpath('./Tools');
global speed;
global Check_Mix;
global DimmingRate;
global GT_label_color;
DimmingRate = 0.3;
speed = 1;
Check_Mix = 1; % 0 = free, 1= Mix
GT_label_color = str2num(get(handles.editColor, 'String'));

% Choose default command line output for Label_v2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Label_v2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Label_v2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function editPath_Callback(hObject, eventdata, handles)
% hObject    handle to editPath (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editPath as text
%        str2double(get(hObject,'String')) returns contents of editPath as a double


% --- Executes during object creation, after setting all properties.
function editPath_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editPath (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbuttonLoad.
function pushbuttonLoad_Callback(hObject, eventdata, handles)
global Auxiliary;
global I;
global Y;
global I_ori;


path = get(handles.editPath,'String');
addpath(path);
num = str2num(get(handles.editImgNum,'String'));
imnames=dir([path '*' 'jpg']); 
I = double(imread(imnames(num).name));
axes(handles.axes1);
imshow(I./255);
I_ori = I;


[h,w,~] = size(I);
Y = ones(h,w)*255;
axes(handles.axes2);
imshow(Y);

set(handles.editImageName, 'String', imnames(num).name);
set(handles.editSaveName, 'String', imnames(num).name);



% --- Executes on button press in pushbuttonPrevious.
function pushbuttonPrevious_Callback(hObject, eventdata, handles)
n = str2num(get(handles.editImgNum, 'String'));
set(handles.editImgNum, 'String', num2str(n-1));
pushbuttonLoad_Callback(hObject, eventdata, handles);


function editImgNum_Callback(hObject, eventdata, handles)
% hObject    handle to editImgNum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editImgNum as text
%        str2double(get(hObject,'String')) returns contents of editImgNum as a double


% --- Executes during object creation, after setting all properties.
function editImgNum_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editImgNum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbuttonNext.
function pushbuttonNext_Callback(hObject, eventdata, handles)
n = str2num(get(handles.editImgNum, 'String'));
set(handles.editImgNum, 'String', num2str(n+1));
pushbuttonLoad_Callback(hObject, eventdata, handles);


% --- Executes on button press in togglebuttonAuxiliary.
function togglebuttonAuxiliary_Callback(hObject, eventdata, handles)



function editMouseStatus_Callback(hObject, eventdata, handles)
% hObject    handle to editMouseStatus (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editMouseStatus as text
%        str2double(get(hObject,'String')) returns contents of editMouseStatus as a double


% --- Executes during object creation, after setting all properties.
function editMouseStatus_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editMouseStatus (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on mouse press over figure background, over a disabled or
% --- inactive control, or over an axes background.
function figure1_WindowButtonDownFcn(hObject, eventdata, handles)
global r;
global height;
global I; % Original image
global Y; % Answer image
global I_tmp; % for Next Step Original image
global Y_tmp; % for tmp answer
global x;
global y;
global x_tmp;
global y_tmp;
global width;
global type;
global color;
I_tmp = 0;
Y_tmp = 0;

currPt = get(gca, 'CurrentPoint');
x = currPt(1,1);
y = currPt(1,2);fprintf('\nx=%f,y=%f',x,y);
set(handles.editMouseStatus, 'string', ['Mouse pressed @ X: ', num2str(round(x)), ', Y: ', num2str(round(y))]);
if x>0 && y>0
    x_tmp = x;
    y_tmp = y;
else
    x = x_tmp;
    y = y_tmp;
end
if x<1
    x = 1;
elseif y<1
    y = 1;
end

cho = get(handles.uibuttongroup1, 'SelectedObject');
type = get(cho,'String');
color  = str2num(get(handles.editColor,'String'));

r      = str2num(get(handles.editRadius,'String'));
height = str2num(get(handles.editHeight,'String'));
width  = str2num(get(handles.editWidth,'String')); 

if strcmp(type,'Circle')
    I_tmp = labelCircle(I, 255,   round(y), round(x), r, 0);
    Y_tmp = labelCircle(Y, color, round(y), round(x), r, 1);
elseif strcmp(type,'Square')
    I_tmp = labelSquare(I, 0,     round(y), round(x), r, r, 0);
    Y_tmp = labelSquare(Y, color, round(y), round(x), r, r, 1);
elseif strcmp(type,'Rectangle(281)')
    width=281;
    I_tmp = labelSquare(I, 0,     round(y), round(x), height, width, 0);
    Y_tmp = labelSquare(Y, color, round(y), round(x), height, width, 1);
elseif strcmp(type,'Retangle(750)')
    width=750;
    I_tmp = labelSquare(I, 0,     round(y), round(x), height, width, 0);
    Y_tmp = labelSquare(Y, color, round(y), round(x), height, width, 1);
elseif strcmp(type,'Rectangle')
    I_tmp = labelSquare(I, 0,     round(y), round(x), height, width, 0);
    Y_tmp = labelSquare(Y, color, round(y), round(x), height, width, 1);   
end

axes(handles.axes1);
imshow(I_tmp./255);
axes(handles.axes2);
imshow(Y_tmp./255);



function editColor_Callback(hObject, eventdata, handles)
% hObject    handle to editColor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editColor as text
%        str2double(get(hObject,'String')) returns contents of editColor as a double


% --- Executes during object creation, after setting all properties.
function editColor_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editColor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editRadius_Callback(hObject, eventdata, handles)
% hObject    handle to editRadius (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editRadius as text
%        str2double(get(hObject,'String')) returns contents of editRadius as a double


% --- Executes during object creation, after setting all properties.
function editRadius_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editRadius (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editHeight_Callback(hObject, eventdata, handles)
% hObject    handle to editHeight (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editHeight as text
%        str2double(get(hObject,'String')) returns contents of editHeight as a double


% --- Executes during object creation, after setting all properties.
function editHeight_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editHeight (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbuttonNextStep.
function pushbuttonNextStep_Callback(hObject, eventdata, handles)
global I; % Original image
global Y; % Answer image
global I_tmp; % for Next Step Original image
global Y_tmp; % for tmp answer

I = I_tmp;
Y = Y_tmp;


% --- Executes on button press in pushbuttonPlus1.
function pushbuttonPlus1_Callback(hObject, eventdata, handles)
global height;
height = str2num(get(handles.editHeight, 'String'));
set(handles.editHeight, 'String', num2str(height+1));
pushbuttonApply_Callback(hObject, eventdata, handles);


% --- Executes on button press in pushbuttonSub1.
function pushbuttonSub1_Callback(hObject, eventdata, handles)
global height;
height = str2num(get(handles.editHeight, 'String'));
set(handles.editHeight, 'String', num2str(height-1));
pushbuttonApply_Callback(hObject, eventdata, handles);


% --- Executes on button press in pushbuttonApply.
function pushbuttonApply_Callback(hObject, eventdata, handles)

global I; % Original image
global Y; % Answer image
global I_tmp; % for Next Step Original image
global Y_tmp; % for tmp answer
global x;
global y;
global width;
global height;
global radius;
r = radius;
cho = get(handles.uibuttongroup1, 'SelectedObject');
type = get(cho,'String');
color  = str2num(get(handles.editColor,'String'));
% r      = str2num(get(handles.editRadius,'String'));
% height = str2num(get(handles.editHeight,'String'));

if strcmp(type,'Circle')
    I_tmp = labelCircle(I, 255,   round(y), round(x), r, 0);
    Y_tmp = labelCircle(Y, color, round(y), round(x), r, 1);
elseif strcmp(type,'Square')
    I_tmp = labelSquare(I, 0,     round(y), round(x), r, r, 0);
    Y_tmp = labelSquare(Y, color, round(y), round(x), r, r, 1);
elseif strcmp(type,'Rectangle(281)')
    width=281;
    I_tmp = labelSquare(I, 0,     round(y), round(x), height, width, 0);
    Y_tmp = labelSquare(Y, color, round(y), round(x), height, width, 1);
elseif strcmp(type,'Retangle(750)')
    width=750;
    I_tmp = labelSquare(I, 0,     round(y), round(x), height, width, 0);
    Y_tmp = labelSquare(Y, color, round(y), round(x), height, width, 1);
elseif strcmp(type,'Rectangle')
    I_tmp = labelSquare(I, 0,     round(y), round(x), height, width, 0);
    Y_tmp = labelSquare(Y, color, round(y), round(x), height, width, 1);   
end

axes(handles.axes1);
imshow(I_tmp./255);
axes(handles.axes2);
imshow(Y_tmp./255);


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
global radius;
radius = str2num(get(handles.editRadius, 'String'))+1;
set(handles.editRadius, 'String', num2str(radius));
pushbuttonApply_Callback(hObject, eventdata, handles);

% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
global radius;
radius = str2num(get(handles.editRadius, 'String'))-1;
set(handles.editRadius, 'String', num2str(radius));
pushbuttonApply_Callback(hObject, eventdata, handles);

% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
pushbuttonApply_Callback(hObject, eventdata, handles);

% --- Executes on button press in pushbuttonSaveImage.
function pushbuttonSaveImage_Callback(hObject, eventdata, handles)
global Y;
global width;
global height;
global radius;
width = 0;
height = 0;
radius = 0;
mkdir(get(handles.edit7,'String'));
path = get(handles.editPath,'String');
num = str2num(get(handles.editImgNum,'String'));
imnames=dir([path '*' 'jpg']); 

SavingName = get(handles.editSaveName,'String');
Path = get(handles.edit7,'String');
FolderName = get(handles.editFolderName,'String');
info = sprintf('%s%s%s%s',Path, FolderName, '\GT\', SavingName);
mkdir(sprintf('%s%s%s',Path, FolderName, '\GT\'));
imwrite(Y, info);
infoImage = sprintf('%s%s%s%s',Path, FolderName,'\Image\', SavingName);
mkdir(sprintf('%s%s%s',Path, FolderName, '\Image\'))
imwrite(imread(imnames(num).name), infoImage);

set(handles.editMouseStatus, 'string', [SavingName,' Save success !']);

function edit7_Callback(hObject, eventdata, handles)

function edit7_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit8_Callback(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit8 as text
%        str2double(get(hObject,'String')) returns contents of edit8 as a double


% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton13.
function pushbutton13_Callback(hObject, eventdata, handles)
n = str2num(get(handles.editWidth, 'String'));
set(handles.editWidth, 'String', num2str(n+1));


% --- Executes on button press in pushbuttonWN.
function pushbuttonWN_Callback(hObject, eventdata, handles)
n = str2num(get(handles.editWidth, 'String'));
set(handles.editWidth, 'String', num2str(n-1));



% --- Executes on button press in pushbutton15.
function pushbutton15_Callback(hObject, eventdata, handles)
n = str2num(get(handles.editRadius, 'String'));
set(handles.editRadius, 'String', num2str(n+1));



function editWidth_Callback(hObject, eventdata, handles)
% hObject    handle to editWidth (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editWidth as text
%        str2double(get(hObject,'String')) returns contents of editWidth as a double


% --- Executes during object creation, after setting all properties.
function editWidth_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editWidth (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton16.
function pushbutton16_Callback(hObject, eventdata, handles)
global width;
width = str2num(get(handles.editWidth, 'String'))+1;
set(handles.editWidth, 'String', num2str(width));
pushbuttonApply_Callback(hObject, eventdata, handles)

% --- Executes on button press in pushbutton17.
function pushbutton17_Callback(hObject, eventdata, handles)
global width;
width = str2num(get(handles.editWidth, 'String'))-1;
set(handles.editWidth, 'String', num2str(width));
pushbuttonApply_Callback(hObject, eventdata, handles)

% --- Executes on button press in pushbutton18.
function pushbutton18_Callback(hObject, eventdata, handles)
pushbuttonApply_Callback(hObject, eventdata, handles);


% --- Executes on button press in pushbutton19.
function pushbutton19_Callback(hObject, eventdata, handles)
global GT_label_color;
set(handles.editColor, 'String', '255');
GT_label_color = 255;

% --- Executes on button press in pushbutton20.
function pushbutton20_Callback(hObject, eventdata, handles)
global GT_label_color;
set(handles.editColor, 'String', '0');
GT_label_color = 0;


function editImageName_Callback(hObject, eventdata, handles)
% hObject    handle to editImageName (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editImageName as text
%        str2double(get(hObject,'String')) returns contents of editImageName as a double


% --- Executes during object creation, after setting all properties.
function editImageName_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editImageName (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editSaveName_Callback(hObject, eventdata, handles)
% hObject    handle to editSaveName (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editSaveName as text
%        str2double(get(hObject,'String')) returns contents of editSaveName as a double


% --- Executes during object creation, after setting all properties.
function editSaveName_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editSaveName (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editFolderName_Callback(hObject, eventdata, handles)
% hObject    handle to editFolderName (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editFolderName as text
%        str2double(get(hObject,'String')) returns contents of editFolderName as a double


% --- Executes during object creation, after setting all properties.
function editFolderName_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editFolderName (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton21.
function pushbutton21_Callback(hObject, eventdata, handles)
n = str2num(get(handles.editImgNum, 'String'));
n = n+10;
set(handles.editImgNum, 'String', num2str(n));



% --- Executes on button press in pushbutton22.
function pushbutton22_Callback(hObject, eventdata, handles)
n = str2num(get(handles.editImgNum, 'String'));
n = n-10;
set(handles.editImgNum, 'String', num2str(n));


% --- Executes on button press in pushbutton23.
function pushbutton23_Callback(hObject, eventdata, handles)
global radius;
radius = 42;
set(handles.editRadius, 'String', num2str(radius));
pushbuttonApply_Callback(hObject, eventdata, handles);

% --- Executes on button press in pushbutton24.
function pushbutton24_Callback(hObject, eventdata, handles)
global radius;
radius = 11;
set(handles.editRadius, 'String', num2str(radius));
pushbuttonApply_Callback(hObject, eventdata, handles);

% --- Executes on button press in pushbutton25.
function pushbutton25_Callback(hObject, eventdata, handles)
global height;
height = str2num(get(handles.editHeight, 'String'))-100;
set(handles.editHeight, 'String', num2str(height));
pushbuttonApply_Callback(hObject, eventdata, handles);

% --- Executes on button press in pushbutton26.
function pushbutton26_Callback(hObject, eventdata, handles)
global height;
height = str2num(get(handles.editHeight, 'String'))-25;
set(handles.editHeight, 'String', num2str(height));
pushbuttonApply_Callback(hObject, eventdata, handles);

% --- Executes on button press in pushbutton27.
function pushbutton27_Callback(hObject, eventdata, handles)
global height;
height = str2num(get(handles.editHeight, 'String'))+25;
set(handles.editHeight, 'String', num2str(height));
pushbuttonApply_Callback(hObject, eventdata, handles);

% --- Executes on button press in pushbutton28.
function pushbutton28_Callback(hObject, eventdata, handles)
global height;
height = str2num(get(handles.editHeight, 'String'))+100;
set(handles.editHeight, 'String', num2str(height));
pushbuttonApply_Callback(hObject, eventdata, handles);

% --- Executes on button press in pushbutton29.
function pushbutton29_Callback(hObject, eventdata, handles)
global width;
width = 281;
set(handles.editWidth, 'String', num2str(width));
pushbuttonApply_Callback(hObject, eventdata, handles);

% --- Executes on button press in pushbutton30.
function pushbutton30_Callback(hObject, eventdata, handles)
global width;
width = str2num(get(handles.editWidth, 'String'))-25;
set(handles.editWidth, 'String', num2str(width));
pushbuttonApply_Callback(hObject, eventdata, handles);

% --- Executes on button press in pushbutton31.
function pushbutton31_Callback(hObject, eventdata, handles)
global width;
width = str2num(get(handles.editWidth, 'String')) +25;
set(handles.editWidth, 'String', num2str(width));
pushbuttonApply_Callback(hObject, eventdata, handles);

% --- Executes on button press in pushbutton32.
function pushbutton32_Callback(hObject, eventdata, handles)
global width;
width = str2num(get(handles.editWidth, 'String')) +100;
set(handles.editWidth, 'String', num2str(width));
pushbuttonApply_Callback(hObject, eventdata, handles);

% --- Executes on button press in pushbutton33.
function pushbutton33_Callback(hObject, eventdata, handles)
global width;
width = 37;
set(handles.editRadius, 'String', num2str(width));
pushbuttonApply_Callback(hObject, eventdata, handles);

% --- Executes on key press with focus on figure1 and none of its controls.

function figure1_KeyPressFcn(hObject, eventdata, handles)
disp(eventdata);
global I; % Original image
global Y; % Answer image
global I_tmp; % for Next Step Original image
global Y_tmp; % for tmp answer
global x;
global y;
global speed;
global r;
global height;
global width;
global radius;
global type;
global color;
global GT_label_color;
if speed<1
    speed = 1;
end
refresh = 1; % update image 

set(handles.text12, 'String', num2str(speed));

cho = get(handles.uibuttongroup1, 'SelectedObject');
% type = get(cho,'String');
% color  = str2num(get(handles.editColor,'String'));


switch eventdata.Key
   
    case 'rightarrow'
        
        width = 0;
        height = 0;
        radius = 0;
        pushbuttonCheckNext_Callback(hObject, eventdata, handles);
    case 'leftarrow'
        
        width = 0;
        height = 0;
        radius = 0;
        pushbuttonCheckPrevious_Callback(hObject, eventdata, handles);
    case 'uparrow'
        width = 0;
        height = 0;
        radius = 0;
        pushbuttonCheckLoad_Callback(hObject, eventdata, handles);
    case 'downarrow'
        width = 0;
        height = 0;
        radius = 0;
        pushbuttonCheckMark_Callback(hObject, eventdata, handles);
    case 'numpad0'
        width = 0;
        height = 0;
        radius = 0;
        
        LoadingPath = get(handles.editPath,'String');
        num = str2num(get(handles.editCheckNum,'String'));

        GTpath = [LoadingPath '\GT\'];
        GTimnames=dir([GTpath '*' 'jpg']); 
        Y = double(imread([GTpath GTimnames(num).name]));
        delete ([GTpath GTimnames(num).name])


        imnames=dir([LoadingPath '\Image\' '*' 'jpg']); 
        I = imread([LoadingPath '\Image\' imnames(num).name] );
        delete ([LoadingPath '\Image\' imnames(num).name] )

        set(handles.editMouseStatus, 'string', [GTimnames(num).name,' Delete success !']);
        
        
    case 'd'
        x = x + speed;
    case 'a'
        x = x - speed;
    case 'w'
        y = y - speed;
    case 's'
        y = y + speed;
    case 'q'
       speed = speed-1;
    case 'e'
       speed = speed+1; 
    case 'space'
        I = I_tmp;
        Y = Y_tmp;
    case 'r'
        r = r+1;
        set(handles.editRadius, 'String', num2str(r));
    case 't'
        r = r-1;
        set(handles.editRadius, 'String', num2str(r));
    case 'f'
        height = height+1;
        set(handles.editHeight, 'String', num2str(height));
    case 'g'    
        height = height-1;
        set(handles.editHeight, 'String', num2str(height));
    case 'v'
        width = width+1;
        set(handles.editWidth, 'String', num2str(width));
    case 'b'
        width = width-1;
        set(handles.editWidth, 'String', num2str(width));

    case 'control'
        pushbuttonCheck_Callback(hObject, eventdata, handles);
        refresh = 0;        
    case '1'
        if x ~=1
            x = 1;
        end
        type = 'Rectangle(281)';
        height = 50; % round(str2num(get(handles.editHeight,'String')) /2);
        color = GT_label_color;
        set(handles.editHeight, 'String', num2str(height));
    case '2'
        if x ~=1
            x = 1;
        end
        type = 'Rectangle(281)';
        height = 100;
        color = GT_label_color;
        set(handles.editHeight, 'String', num2str(height));
    case '3'
        if x ~=1
            x = 1;
        end
        type = 'Rectangle';
        height = 200;
        color = GT_label_color;
        set(handles.editHeight, 'String', num2str(height));
    case '4'
        type = 'Circle';
        color = GT_label_color;
    case '5'
        type = 'Square';
        color = 150;
        r = 25;


      
    case 'j'
        pushbuttonNext_Callback(hObject, eventdata, handles);
        pushbuttonLoad_Callback(hObject, eventdata, handles);
    case 'alt'
        pushbuttonSaveImage_Callback(hObject, eventdata, handles);
    case 'shift'
        if x ~=1
            x = 1;
        end
    case 'capslock'
        type = 'Rectangle(281)';
        height = round(str2num(get(handles.editHeight,'String')) /2);
        color = GT_label_color;
        set(handles.editHeight, 'String', num2str(height));
end



if refresh
    if strcmp(type,'Circle')
        I_tmp = labelCircle(I, 255,   round(y), round(x), r, 0);
        Y_tmp = labelCircle(Y, color, round(y), round(x), r, 1);
    elseif strcmp(type,'Square')
        I_tmp = labelSquare(I, 0,     round(y), round(x), r, r, 0);
        Y_tmp = labelSquare(Y, color, round(y), round(x), r, r, 1);
    elseif strcmp(type,'Rectangle(281)')
        width=281;
        I_tmp = labelSquare(I, 0,     round(y), round(x), height, width, 0);
        Y_tmp = labelSquare(Y, color, round(y), round(x), height, width, 1);
    elseif strcmp(type,'Retangle(750)')
        width=750;
        I_tmp = labelSquare(I, 0,     round(y), round(x), height, width, 0);
        Y_tmp = labelSquare(Y, color, round(y), round(x), height, width, 1);
    elseif strcmp(type,'Rectangle')
        I_tmp = labelSquare(I, 0,     round(y), round(x), height, width, 0);
        Y_tmp = labelSquare(Y, color, round(y), round(x), height, width, 1);   
    end
    axes(handles.axes1);
    imshow(I_tmp./255);
    axes(handles.axes2);
    imshow(Y_tmp./255);
end



% --- Executes on button press in pushbuttonCheckLoad.
function pushbuttonCheckLoad_Callback(hObject, eventdata, handles)
global Check_Mix;
global I;
global Y;
global DimmingRate;

path = get(handles.editPath,'String');
num = str2num(get(handles.editCheckNum,'String'));

GTpath = [path '\GT\'];
GTimnames=dir([GTpath '*' 'jpg']); 
Y = double(imread([GTpath GTimnames(num).name]));
axes(handles.axes2);
imshow(Y./255);

imnames=dir([path '\Image\' '*' 'jpg']); 
I = double(imread([path '\Image\' imnames(num).name] ));

if Check_Mix
    I(:,:,1)  = I(:,:,1)-Y * DimmingRate;
    I(:,:,2)  = I(:,:,2)-Y * DimmingRate;
    I(:,:,3)  = I(:,:,3)-Y * DimmingRate;
end

axes(handles.axes1);
imshow(I./255);


set(handles.editImageName, 'String', imnames(num).name);
set(handles.editSaveName, 'String', GTimnames(num).name);

% --- Executes on button press in pushbuttonCheckNext.
function pushbuttonCheckNext_Callback(hObject, eventdata, handles)
n = str2num(get(handles.editCheckNum, 'String'));
set(handles.editCheckNum, 'String', num2str(n+1));
pushbuttonCheckLoad_Callback(hObject, eventdata, handles);
% --- Executes on button press in pushbuttonDelete.
function pushbuttonDelete_Callback(hObject, eventdata, handles)



% --- Executes on button press in pushbuttonCheckPrevious.
function pushbuttonCheckPrevious_Callback(hObject, eventdata, handles)
n = str2num(get(handles.editCheckNum, 'String'));
set(handles.editCheckNum, 'String', num2str(n-1));
pushbuttonCheckLoad_Callback(hObject, eventdata, handles);

function editCheckNum_Callback(hObject, eventdata, handles)
% hObject    handle to editCheckNum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editCheckNum as text
%        str2double(get(hObject,'String')) returns contents of editCheckNum as a double


% --- Executes during object creation, after setting all properties.
function editCheckNum_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editCheckNum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbuttonCheckMark.
function pushbuttonCheckMark_Callback(hObject, eventdata, handles)

mkdir(get(handles.edit7,'String'));
LoadingPath = get(handles.editPath,'String');
num = str2num(get(handles.editCheckNum,'String'));

GTpath = [LoadingPath '\GT\'];
GTimnames=dir([GTpath '*' 'jpg']); 
Y = double(imread([GTpath GTimnames(num).name]));
SavingName = GTimnames(num).name;
Path = get(handles.edit7,'String');
FolderName = get(handles.editFolderName,'String');
info = sprintf('%s%s%s%s',Path, FolderName, '\GT\', SavingName);
mkdir(sprintf('%s%s%s',Path, FolderName, '\GT\'));
imwrite(Y, info);
delete ([GTpath GTimnames(num).name])


imnames=dir([LoadingPath '\Image\' '*' 'jpg']); 
I = imread([LoadingPath '\Image\' imnames(num).name] );

infoImage = sprintf('%s%s%s%s',Path, FolderName,'\Image\', SavingName);
mkdir(sprintf('%s%s%s',Path, FolderName, '\Image\'))
imwrite(I, infoImage);
delete ([LoadingPath '\Image\' imnames(num).name] )

set(handles.editMouseStatus, 'string', [SavingName,' Move success !']);




% --- Executes on button press in pushbuttonCheckMix.
function pushbuttonCheckMix_Callback(hObject, eventdata, handles)
global Check_Mix;

if Check_Mix==0
    Check_Mix = 1;
    set(handles.pushbuttonCheckMix,'string','Mix','enable','on');
else
    Check_Mix = 0;
    set(handles.pushbuttonCheckMix,'string','Free','enable','on');
end


% --- Executes during object creation, after setting all properties.
function pushbuttonCheckLoad_CreateFcn(hObject, eventdata, handles)

% --- Executes on button press in pushbuttonCheck.
function pushbuttonCheck_Callback(hObject, eventdata, handles)
global Check_Mix;
global I_ori;
global I;
global Y;
global DimmingRate;

if Check_Mix
            I_check(:,:,1)  = I_ori(:,:,1)-Y * DimmingRate;
            I_check(:,:,2)  = I_ori(:,:,2)-Y * DimmingRate;
            I_check(:,:,3)  = I_ori(:,:,3)-Y * DimmingRate;
            axes(handles.axes1);
            imshow(I_check./255);
            axes(handles.axes2);
            imshow(Y./255);
            
    Check_Mix = 0;
else
    axes(handles.axes1);
    imshow(I./255);
    Check_Mix = 1;
end
