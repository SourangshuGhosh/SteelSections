function varargout = Opening_Dialog(varargin)
% OPENING_DIALOG MATLAB code for Opening_Dialog.fig
%      OPENING_DIALOG, by itself, creates a new OPENING_DIALOG or raises the existing
%      singleton*.
%
%      H = OPENING_DIALOG returns the handle to a new OPENING_DIALOG or the handle to
%      the existing singleton*.
%
%      OPENING_DIALOG('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in OPENING_DIALOG.M with the given input arguments.
%
%      OPENING_DIALOG('Property','Value',...) creates a new OPENING_DIALOG or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Opening_Dialog_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Opening_Dialog_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Opening_Dialog

% Last Modified by GUIDE v2.5 31-May-2014 00:29:33

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Opening_Dialog_OpeningFcn, ...
                   'gui_OutputFcn',  @Opening_Dialog_OutputFcn, ...
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


% --- Executes just before Opening_Dialog is made visible.
function Opening_Dialog_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Opening_Dialog (see VARARGIN)

% Choose default command line output for Opening_Dialog
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Opening_Dialog wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Opening_Dialog_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in close.
function close_Callback(hObject, eventdata, handles)
% hObject    handle to close (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(Opening_Dialog,'Visible','off');
Thank_You;

% --- Executes on button press in next.
function next_Callback(hObject, eventdata, handles)
% hObject    handle to next (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(Opening_Dialog,'Visible','off');
if(get(handles.supp,'Value'))
    Beam_design;
elseif(get(handles.unsupp,'Value'))
    Unsupp_Beam_Design;
end
