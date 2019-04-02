classdef MouseMsgPassIRL < robotics.ros.Message
    %MouseMsgPassIRL MATLAB implementation of mouse_perturbation_robot/MouseMsgPassIRL
    %   This class was automatically generated by
    %   robotics.ros.msg.internal.gen.MessageClassGenerator.
    
    %   Copyright 2014-2019 The MathWorks, Inc.
    
    %#ok<*INUSD>
    
    properties (Constant)
        MessageType = 'mouse_perturbation_robot/MouseMsgPassIRL' % The ROS message type
    end
    
    properties (Constant, Hidden)
        MD5Checksum = '04c09f172bb936202106874789130110' % The MD5 Checksum of the message definition
    end
    
    properties (Access = protected)
        JavaMessage % The Java message object
    end
    
    properties (Constant, Access = protected)
        GeometryMsgsPoseClass = robotics.ros.msg.internal.MessageFactory.getClassForType('geometry_msgs/Pose') % Dispatch to MATLAB class for message type geometry_msgs/Pose
    end
    
    properties (Dependent)
        Xyz
    end
    
    properties (Access = protected)
        Cache = struct('Xyz', []) % The cache for fast data access
    end
    
    properties (Constant, Hidden)
        PropertyList = {'Xyz'} % List of non-constant message properties
        ROSPropertyList = {'xyz'} % List of non-constant ROS message properties
    end
    
    methods
        function obj = MouseMsgPassIRL(msg)
            %MouseMsgPassIRL Construct the message object MouseMsgPassIRL
            import com.mathworks.toolbox.robotics.ros.message.MessageInfo;
            
            % Support default constructor
            if nargin == 0
                obj.JavaMessage = obj.createNewJavaMessage;
                return;
            end
            
            % Construct appropriate empty array
            if isempty(msg)
                obj = obj.empty(0,1);
                return;
            end
            
            % Make scalar construction fast
            if isscalar(msg)
                % Check for correct input class
                if ~MessageInfo.compareTypes(msg(1), obj.MessageType)
                    error(message('robotics:ros:message:NoTypeMatch', obj.MessageType, ...
                        char(MessageInfo.getType(msg(1))) ));
                end
                obj.JavaMessage = msg(1);
                return;
            end
            
            % Check that this is a vector of scalar messages. Since this
            % is an object array, use arrayfun to verify.
            if ~all(arrayfun(@isscalar, msg))
                error(message('robotics:ros:message:MessageArraySizeError'));
            end
            
            % Check that all messages in the array have the correct type
            if ~all(arrayfun(@(x) MessageInfo.compareTypes(x, obj.MessageType), msg))
                error(message('robotics:ros:message:NoTypeMatchArray', obj.MessageType));
            end
            
            % Construct array of objects if necessary
            objType = class(obj);
            for i = 1:length(msg)
                obj(i,1) = feval(objType, msg(i)); %#ok<AGROW>
            end
        end
        
        function xyz = get.Xyz(obj)
            %get.Xyz Get the value for property Xyz
            if isempty(obj.Cache.Xyz)
                javaArray = obj.JavaMessage.getXyz;
                array = obj.readJavaArray(javaArray, obj.GeometryMsgsPoseClass);
                obj.Cache.Xyz = feval(obj.GeometryMsgsPoseClass, array);
            end
            xyz = obj.Cache.Xyz;
        end
        
        function set.Xyz(obj, xyz)
            %set.Xyz Set the value for property Xyz
            if ~isvector(xyz) && isempty(xyz)
                % Allow empty [] input
                xyz = feval([obj.GeometryMsgsPoseClass '.empty'], 0, 1);
            end
            
            validateattributes(xyz, {obj.GeometryMsgsPoseClass}, {'vector'}, 'MouseMsgPassIRL', 'Xyz');
            
            javaArray = obj.JavaMessage.getXyz;
            array = obj.writeJavaArray(xyz, javaArray, obj.GeometryMsgsPoseClass);
            obj.JavaMessage.setXyz(array);
            
            % Update cache if necessary
            if ~isempty(obj.Cache.Xyz)
                obj.Cache.Xyz = [];
                obj.Cache.Xyz = obj.Xyz;
            end
        end
    end
    
    methods (Access = protected)
        function resetCache(obj)
            %resetCache Resets any cached properties
            obj.Cache.Xyz = [];
        end
        
        function cpObj = copyElement(obj)
            %copyElement Implements deep copy behavior for message
            
            % Call default copy method for shallow copy
            cpObj = copyElement@robotics.ros.Message(obj);
            
            % Clear any existing cached properties
            cpObj.resetCache;
            
            % Create a new Java message object
            cpObj.JavaMessage = obj.createNewJavaMessage;
            
            % Recursively copy compound properties
            cpObj.Xyz = copy(obj.Xyz);
        end
        
        function reload(obj, strObj)
            %reload Called by loadobj to assign properties
            XyzCell = arrayfun(@(x) feval([obj.GeometryMsgsPoseClass '.loadobj'], x), strObj.Xyz, 'UniformOutput', false);
            obj.Xyz = vertcat(XyzCell{:});
        end
    end
    
    methods (Access = ?robotics.ros.Message)
        function strObj = saveobj(obj)
            %saveobj Implements saving of message to MAT file
            
            % Return an empty element if object array is empty
            if isempty(obj)
                strObj = struct.empty;
                return
            end
            
            strObj.Xyz = arrayfun(@(x) saveobj(x), obj.Xyz);
        end
    end
    
    methods (Static, Access = {?matlab.unittest.TestCase, ?robotics.ros.Message})
        function obj = loadobj(strObj)
            %loadobj Implements loading of message from MAT file
            
            % Return an empty object array if the structure element is not defined
            if isempty(strObj)
                obj = robotics.ros.custom.msggen.mouse_perturbation_robot.MouseMsgPassIRL.empty(0,1);
                return
            end
            
            % Create an empty message object
            obj = robotics.ros.custom.msggen.mouse_perturbation_robot.MouseMsgPassIRL;
            obj.reload(strObj);
        end
    end
end