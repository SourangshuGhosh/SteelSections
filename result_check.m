function varargout = result_check(varargin)
% RESULT_CHECK MATLAB code for result_check.fig
%      RESULT_CHECK, by itself, creates a new RESULT_CHECK or raises the existing
%      singleton*.
%
%      H = RESULT_CHECK returns the handle to a new RESULT_CHECK or the handle to
%      the existing singleton*.
%
%      RESULT_CHECK('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RESULT_CHECK.M with the given input arguments.
%
%      RESULT_CHECK('Property','Value',...) creates a new RESULT_CHECK or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before result_check_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to result_check_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help result_check

% Last Modified by GUIDE v2.5 04-Jun-2014 07:11:10

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @result_check_OpeningFcn, ...
                   'gui_OutputFcn',  @result_check_OutputFcn, ...
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


% --- Executes just before result_check is made visible.
function result_check_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to result_check (see VARARGIN)

% Choose default command line output for result_check
handles.output = hObject;
  beam_chosen=getappdata(0,'bbb1');
    set(handles.res,'string',beam_chosen);
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes result_check wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = result_check_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in restart.
function restart_Callback(hObject, eventdata, handles)
% hObject    handle to restart (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(result_check,'Visible','off');
Opening_Dialog;

% --- Executes on button press in close.
function close_Callback(hObject, eventdata, handles)
% hObject    handle to close (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(result_check,'Visible','off');
Thank_You;

% --- Executes on button press in help.
function help_Callback(hObject, eventdata, handles)
% hObject    handle to help (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
open('helpun.pdf');


% --- Executes on button press in output.
function output_Callback(hObject, eventdata, handles)
% hObject    handle to output (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
open('.\output.doc');
