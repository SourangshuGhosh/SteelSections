function varargout = Beam_design(varargin)
% BEAM_DESIGN MATLAB code for Beam_design.fig
%      BEAM_DESIGN, by itself, creates a new BEAM_DESIGN or raises the existing
%      singleton*.
%
%      H = BEAM_DESIGN returns the handle to a new BEAM_DESIGN or the handle to
%      the existing singleton*.
%
%      BEAM_DESIGN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in BEAM_DESIGN.M with the given input arguments.
%
%      BEAM_DESIGN('Property','Value',...) creates a new BEAM_DESIGN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Beam_design_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Beam_design_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Beam_design

% Last Modified by GUIDE v2.5 08-Jul-2014 22:16:20

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Beam_design_OpeningFcn, ...
                   'gui_OutputFcn',  @Beam_design_OutputFcn, ...
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


% --- Executes just before Beam_design is made visible.
function Beam_design_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Beam_design (see VARARGIN)

% Choose default command line output for Beam_design
handles.output = hObject;
set(handles.shr,'String',10)
set(handles.mom,'String',15)
set(handles.span,'String',5)
set(handles.def,'String',5000)
set(handles.edit_fy,'String',250)
set(handles.edit_y,'String',1.1)
set(handles.edit_yng,'String',200000)
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Beam_design wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Beam_design_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in next.
function next_Callback(hObject, eventdata, handles)
% hObject    handle to next (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
fac_shr = str2double(get(handles.shr,'String')) ;
fac_mom = str2double(get(handles.mom,'String')) ;
eff_spn = str2double(get(handles.span,'String')) ;
def_check = str2double(get(handles.def,'String')) ;
% Grade of steel
if(get(handles.fe410,'Value'))
    fy = 250;
else
    fy = str2double(get(handles.edit_fy,'String'));
end


% Partial safety factors for steel
if(get(handles.psf,'Value'))
    psf = 1.10;
else
    psf = str2double(get(handles.edit_y,'String'));
end

%young's modulus
yng = str2double(get(handles.edit_yng,'String'));

% Printing it in a file
%if isnan(fac_shr) || isnan(fac_mom) || isnan(eff_spn)|| isnan(fy) || isnan(psf) || isnan(yng)
%    errordlg('You have not entered valid values','Invalid Input','modal');
if isnan(fac_shr)
    errordlg('You have not entered Factored Shear','Input Missing','modal');
elseif isnan(fac_mom)
        errordlg('You have not entered Factored Moment','Input Missing','modal');
elseif isnan(eff_spn)
        errordlg('You have not entered Effective Span','Input Missing','modal');
elseif isnan(fy)
        errordlg('You have not entered Yield Stress','Input Missing','modal');
elseif isnan(psf)
        errordlg('You have not entered Safety Factor','Input Missing','modal');
elseif isnan(yng)
        errordlg('You have not entered Youngs Modulus','Input Missing','modal');        
else
    setappdata(0,'a',fac_shr);
    setappdata(0,'b',fac_mom);
    setappdata(0,'c',eff_spn);
    setappdata(0,'d',fy);
    setappdata(0,'e',psf);
    setappdata(0,'f',yng);
    setappdata(0,'g',def_check);
    
    set(Beam_design,'Visible','off');
    Proceed_To_Design;
end

% --- Executes on button press in Close.
function Close_Callback(hObject, eventdata, handles)
% hObject    handle to Close (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(Beam_design,'Visible','off');
Thank_You;


function edit_yng_Callback(hObject, eventdata, handles)
% hObject    handle to edit_yng (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_yng as text
%        str2double(get(hObject,'String')) returns contents of edit_yng as a double


% --- Executes during object creation, after setting all properties.
function edit_yng_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_yng (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function shr_Callback(hObject, eventdata, handles)
% hObject    handle to shr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of shr as text
%        str2double(get(hObject,'String')) returns contents of shr as a double


% --- Executes during object creation, after setting all properties.
function shr_CreateFcn(hObject, eventdata, handles)
% hObject    handle to shr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function mom_Callback(hObject, eventdata, handles)
% hObject    handle to mom (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of mom as text
%        str2double(get(hObject,'String')) returns contents of mom as a double


% --- Executes during object creation, after setting all properties.
function mom_CreateFcn(hObject, eventdata, handles)
% hObject    handle to mom (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function span_Callback(hObject, eventdata, handles)
% hObject    handle to span (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of span as text
%        str2double(get(hObject,'String')) returns contents of span as a double


% --- Executes during object creation, after setting all properties.
function span_CreateFcn(hObject, eventdata, handles)
% hObject    handle to span (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_y_Callback(hObject, eventdata, handles)
% hObject    handle to edit_y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_y as text
%        str2double(get(hObject,'String')) returns contents of edit_y as a double


% --- Executes during object creation, after setting all properties.
function edit_y_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in psf.
function psf_Callback(hObject, eventdata, handles)
% hObject    handle to psf (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if(get(hObject,'value'))
    set(handles.edit_y,'enable','off')
else
    set(handles.edit_y,'enable','on')
end
% Hint: get(hObject,'Value') returns toggle state of psf



function edit_fy_Callback(hObject, eventdata, handles)
% hObject    handle to edit_fy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of edit_fy as text
%        str2double(get(hObject,'String')) returns contents of edit_fy as a double


% --- Executes during object creation, after setting all properties.
function edit_fy_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_fy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in fe410.
function fe410_Callback(hObject, eventdata, handles)
% hObject    handle to fe410 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if(get(hObject,'value'))
    set(handles.edit_fy,'enable','off')
else
    set(handles.edit_fy,'enable','on')
end
% Hint: get(hObject,'Value') returns toggle state of fe410


% --- Executes on button press in back.
function back_Callback(hObject, eventdata, handles)
% hObject    handle to back (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(Beam_design,'Visible','off');
Opening_Dialog;



function def_Callback(hObject, eventdata, handles)
% hObject    handle to def (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of def as text
%        str2double(get(hObject,'String')) returns contents of def as a double


% --- Executes during object creation, after setting all properties.
function def_CreateFcn(hObject, eventdata, handles)
% hObject    handle to def (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
open('deflection.pdf');


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
open('helps.pdf');
