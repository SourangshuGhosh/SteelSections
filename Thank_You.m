function varargout = Thank_You(varargin)
% THANK_YOU MATLAB code for Thank_You.fig
%      THANK_YOU, by itself, creates a new THANK_YOU or raises the existing
%      singleton*.
%
%      H = THANK_YOU returns the handle to a new THANK_YOU or the handle to
%      the existing singleton*.
%
%      THANK_YOU('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in THANK_YOU.M with the given input arguments.
%
%      THANK_YOU('Property','Value',...) creates a new THANK_YOU or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Thank_You_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Thank_You_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Thank_You

% Last Modified by GUIDE v2.5 05-Jun-2014 02:13:49

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Thank_You_OpeningFcn, ...
                   'gui_OutputFcn',  @Thank_You_OutputFcn, ...
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


% --- Executes just before Thank_You is made visible.
function Thank_You_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Thank_You (see VARARGIN)

% Choose default command line output for Thank_You
handles.output = hObject;
imshow('image.png');
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Thank_You wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Thank_You_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in exit.
function exit_Callback(hObject, eventdata, handles)
% hObject    handle to exit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(Thank_You,'Visible','off');


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
open('disclaimer.pdf');
