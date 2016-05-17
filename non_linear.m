function varargout = non_linear(varargin)
% NON_LINEAR MATLAB code for non_linear.fig
%      NON_LINEAR, by itself, creates a new NON_LINEAR or raises the existing
%      singleton*.
%
%      H = NON_LINEAR returns the handle to a new NON_LINEAR or the handle to
%      the existing singleton*.
%
%      NON_LINEAR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in NON_LINEAR.M with the given input arguments.
%
%      NON_LINEAR('Property','Value',...) creates a new NON_LINEAR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before non_linear_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to non_linear_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help non_linear

% Last Modified by GUIDE v2.5 15-May-2016 14:09:54

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @non_linear_OpeningFcn, ...
                   'gui_OutputFcn',  @non_linear_OutputFcn, ...
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


% --- Executes just before non_linear is made visible.
function non_linear_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to non_linear (see VARARGIN)

% Choose default command line output for non_linear
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes non_linear wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = non_linear_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edt_x0_Callback(hObject, eventdata, handles)
% hObject    handle to edt_x0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edt_x0 as text
%        str2double(get(hObject,'String')) returns contents of edt_x0 as a double


% --- Executes during object creation, after setting all properties.
function edt_x0_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edt_x0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edt_y0_Callback(hObject, eventdata, handles)
% hObject    handle to edt_y0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edt_y0 as text
%        str2double(get(hObject,'String')) returns contents of edt_y0 as a double


% --- Executes during object creation, after setting all properties.
function edt_y0_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edt_y0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edt_P_Callback(hObject, eventdata, handles)
% hObject    handle to edt_P (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edt_P as text
%        str2double(get(hObject,'String')) returns contents of edt_P as a double


% --- Executes during object creation, after setting all properties.
function edt_P_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edt_P (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edt_Q_Callback(hObject, eventdata, handles)
% hObject    handle to edt_Q (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edt_Q as text
%        str2double(get(hObject,'String')) returns contents of edt_Q as a double


% --- Executes during object creation, after setting all properties.
function edt_Q_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edt_Q (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edt_R_Callback(hObject, eventdata, handles)
% hObject    handle to edt_R (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edt_R as text
%        str2double(get(hObject,'String')) returns contents of edt_R as a double


% --- Executes during object creation, after setting all properties.
function edt_R_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edt_R (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edt_N_Callback(hObject, eventdata, handles)
% hObject    handle to edt_N (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edt_N as text
%        str2double(get(hObject,'String')) returns contents of edt_N as a double


% --- Executes during object creation, after setting all properties.
function edt_N_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edt_N (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btn_ekf.
function btn_ekf_Callback(hObject, eventdata, handles)
% hObject    handle to btn_ekf (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if ( judge(handles) == 1)
    start_ekf(handles);
else
    errordlg('参数错误','错误');
end

% --- Executes on button press in btn_ukf.
function btn_ukf_Callback(hObject, eventdata, handles)
% hObject    handle to btn_ukf (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if ( judge(handles) == 1)
    start_ukf(handles);
else
    errordlg('参数错误','错误');
end


% --- Executes on button press in btn_clean.
function btn_clean_Callback(hObject, eventdata, handles)
% hObject    handle to btn_clean (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


set(handles.edt_x0,'String','');
set(handles.edt_y0,'String','');
set(handles.edt_N,'String','');
set(handles.edt_P,'String','');
set(handles.edt_Q,'String','');
set(handles.edt_R,'String','');
set(handles.edt_tar,'String','');


function out = judge( handles)
x0 = get(handles.edt_x0,'String');
y0 = get(handles.edt_y0,'String');
N = get(handles.edt_N,'String');
P = get(handles.edt_P,'String');
Q = get(handles.edt_Q,'String');
R = get(handles.edt_R,'String');
tar = get(handles.edt_tar,'String');

out = 0;
if( isempty(x0) || isempty(y0) || isempty(N) || isempty(P) || isempty(Q) || isempty(R) || isempty(tar)) 
    % 只有在均有值时才继续
else    
    out= 1;
end



function edt_tar_Callback(hObject, eventdata, handles)
% hObject    handle to edt_tar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edt_tar as text
%        str2double(get(hObject,'String')) returns contents of edt_tar as a double


% --- Executes during object creation, after setting all properties.
function edt_tar_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edt_tar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
