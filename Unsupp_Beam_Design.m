function varargout = Unsupp_Beam_Design(varargin)
% UNSUPP_BEAM_DESIGN MATLAB code for Unsupp_Beam_Design.fig
%      UNSUPP_BEAM_DESIGN, by itself, creates a new UNSUPP_BEAM_DESIGN or raises the existing
%      singleton*.
%
%      H = UNSUPP_BEAM_DESIGN returns the handle to a new UNSUPP_BEAM_DESIGN or the handle to
%      the existing singleton*.
%
%      UNSUPP_BEAM_DESIGN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UNSUPP_BEAM_DESIGN.M with the given input arguments.
%
%      UNSUPP_BEAM_DESIGN('Property','Value',...) creates a new UNSUPP_BEAM_DESIGN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Unsupp_Beam_Design_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Unsupp_Beam_Design_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Unsupp_Beam_Design

% Last Modified by GUIDE v2.5 08-Jul-2014 22:13:54

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Unsupp_Beam_Design_OpeningFcn, ...
                   'gui_OutputFcn',  @Unsupp_Beam_Design_OutputFcn, ...
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


% --- Executes just before Unsupp_Beam_Design is made visible.
function Unsupp_Beam_Design_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Unsupp_Beam_Design (see VARARGIN)

% Choose default command line output for Unsupp_Beam_Design
handles.output = hObject;
set(handles.factoredshear,'String',10)
set(handles.factoredmoment,'String',15)
set(handles.effectivespan,'String',5)
set(handles.valuefordeflection,'String',5000)
set(handles.editfy,'String',250)
set(handles.edity,'String',1.1)
set(handles.edityng,'String',200000)
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Unsupp_Beam_Design wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Unsupp_Beam_Design_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in back.
function back_Callback(hObject, eventdata, handles)
% hObject    handle to back (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(Unsupp_Beam_Design,'Visible','off');
Opening_Dialog;

% --- Executes on button press in close.
function close_Callback(hObject, eventdata, handles)
% hObject    handle to close (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(Unsupp_Beam_Design,'Visible','off');
Thank_You;

% --- Executes on button press in next.
function next_Callback(hObject, eventdata, handles)
% hObject    handle to next (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
factored_shear = str2double(get(handles.factoredshear,'String')) ;
factored_moment = str2double(get(handles.factoredmoment,'String')) ;
effective_span = str2double(get(handles.effectivespan,'String')) ;
deflection_check = str2double(get(handles.valuefordeflection,'String')) ;
%steel section Type
if(get(handles.rolledsteel,'Value'))
    steel_section_type=.21;
elseif(get(handles.weldedsteel,'Value'))
    steel_section_type=.49;
end
% Grade of steel
if(get(handles.fe410,'Value'))
    yield_stress = 250;
else
    yield_stress = str2double(get(handles.editfy,'String'));
end


% Partial safety factors for steel
if(get(handles.psf,'Value'))
    partial_safety_factor = 1.10;
else
    partial_safety_factor = str2double(get(handles.edity,'String'));
end

%young's modulus
youngs_modulus = str2double(get(handles.edityng,'String'));

if isnan(factored_shear)
    errordlg('You have not entered Factored Shear','Input Missing','modal');
elseif isnan(factored_moment)
        errordlg('You have not entered Factored Moment','Input Missing','modal');
elseif isnan(effective_span)
        errordlg('You have not entered Effective Span','Input Missing','modal');
elseif isnan(deflection_check)
        errordlg('You have not entered Value for Deflection','Input Missing','modal');        
elseif isnan(yield_stress)
        errordlg('You have not entered Yield Stress','Input Missing','modal');
elseif isnan(partial_safety_factor)
        errordlg('You have not entered Safety Factor','Input Missing','modal');
elseif isnan(youngs_modulus)
        errordlg('You have not entered Youngs Modulus','Input Missing','modal');        
else
    setappdata(0,'a',factored_shear);
    setappdata(0,'b',factored_moment);
    setappdata(0,'c',effective_span);
    setappdata(0,'d',deflection_check);
    setappdata(0,'e',steel_section_type);
    setappdata(0,'f',yield_stress);
    setappdata(0,'g',partial_safety_factor);
    setappdata(0,'h',youngs_modulus);
    
    set(Unsupp_Beam_Design,'Visible','off');
    Proceed_To_Design_Unsupp;
end

function edityng_Callback(hObject, eventdata, handles)
% hObject    handle to edityng (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edityng as text
%        str2double(get(hObject,'String')) returns contents of edityng as a double


% --- Executes during object creation, after setting all properties.
function edityng_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edityng (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function factoredshear_Callback(hObject, eventdata, handles)
% hObject    handle to factoredshear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of factoredshear as text
%        str2double(get(hObject,'String')) returns contents of factoredshear as a double


% --- Executes during object creation, after setting all properties.
function factoredshear_CreateFcn(hObject, eventdata, handles)
% hObject    handle to factoredshear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function factoredmoment_Callback(hObject, eventdata, handles)
% hObject    handle to factoredmoment (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of factoredmoment as text
%        str2double(get(hObject,'String')) returns contents of factoredmoment as a double


% --- Executes during object creation, after setting all properties.
function factoredmoment_CreateFcn(hObject, eventdata, handles)
% hObject    handle to factoredmoment (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function effectivespan_Callback(hObject, eventdata, handles)
% hObject    handle to effectivespan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of effectivespan as text
%        str2double(get(hObject,'String')) returns contents of effectivespan as a double


% --- Executes during object creation, after setting all properties.
function effectivespan_CreateFcn(hObject, eventdata, handles)
% hObject    handle to effectivespan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function valuefordeflection_Callback(hObject, eventdata, handles)
% hObject    handle to valuefordeflection (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of valuefordeflection as text
%        str2double(get(hObject,'String')) returns contents of valuefordeflection as a double


% --- Executes during object creation, after setting all properties.
function valuefordeflection_CreateFcn(hObject, eventdata, handles)
% hObject    handle to valuefordeflection (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in help.
function help_Callback(hObject, eventdata, handles)
% hObject    handle to help (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
open('deflection.pdf');

% --- Executes on button press in psf.
function psf_Callback(hObject, eventdata, handles)
% hObject    handle to psf (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if(get(hObject,'value'))
    set(handles.edity,'enable','off')
else
    set(handles.edity,'enable','on')
end
% Hint: get(hObject,'Value') returns toggle state of psf



function edity_Callback(hObject, eventdata, handles)
% hObject    handle to edity (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edity as text
%        str2double(get(hObject,'String')) returns contents of edity as a double


% --- Executes during object creation, after setting all properties.
function edity_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edity (see GCBO)
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
    set(handles.editfy,'enable','off')
else
    set(handles.editfy,'enable','on')
end
% Hint: get(hObject,'Value') returns toggle state of fe410



function editfy_Callback(hObject, eventdata, handles)
% hObject    handle to editfy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editfy as text
%        str2double(get(hObject,'String')) returns contents of editfy as a double


% --- Executes during object creation, after setting all properties.
function editfy_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editfy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton5.

% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
open('helpun.pdf');
