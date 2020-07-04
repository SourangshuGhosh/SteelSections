function varargout = result_check_unsupp(varargin)
% RESULT_CHECK_UNSUPP MATLAB code for result_check_unsupp.fig
%      RESULT_CHECK_UNSUPP, by itself, creates a new RESULT_CHECK_UNSUPP or raises the existing
%      singleton*.
%
%      H = RESULT_CHECK_UNSUPP returns the handle to a new RESULT_CHECK_UNSUPP or the handle to
%      the existing singleton*.
%
%      RESULT_CHECK_UNSUPP('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RESULT_CHECK_UNSUPP.M with the given input arguments.
%
%      RESULT_CHECK_UNSUPP('Property','Value',...) creates a new RESULT_CHECK_UNSUPP or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before result_check_unsupp_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to result_check_unsupp_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help result_check_unsupp

% Last Modified by GUIDE v2.5 30-Jun-2014 08:26:56

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @result_check_unsupp_OpeningFcn, ...
                   'gui_OutputFcn',  @result_check_unsupp_OutputFcn, ...
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


% --- Executes just before result_check_unsupp is made visible.
function result_check_unsupp_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to result_check_unsupp (see VARARGIN)

% Choose default command line output for result_check_unsupp
handles.output = hObject;
  beam_chosen=getappdata(0,'bbb1');
    set(handles.text,'string',beam_chosen);
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes result_check_unsupp wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = result_check_unsupp_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in output.
function output_Callback(hObject, eventdata, handles)
% hObject    handle to output (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
open('.\output.doc');

% --- Executes on button press in redesign.
function redesign_Callback(hObject, eventdata, handles)
% hObject    handle to redesign (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(result_check_unsupp,'Visible','off');
Opening_Dialog;

% --- Executes on button press in close.
function close_Callback(hObject, eventdata, handles)
% hObject    handle to close (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(result_check_unsupp,'Visible','off');
Thank_You;

% --- Executes on button press in help.
function help_Callback(hObject, eventdata, handles)
% hObject    handle to help (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
open('help.pdf');
