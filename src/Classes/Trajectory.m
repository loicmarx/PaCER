%% Trajectory - represents a (straight line) trajectory by two Point3D (entry and target) objects
%
% Andreas Husch
% Centre Hospitalier de Luxembourg, Dep. of Neurosurgery /
% University of Luxembourg - Luxembourg Centre for Systems Biomedicne
% 2013 - 2017
% mail@andreashusch.de
classdef Trajectory < handle & matlab.mixin.Copyable & MetaTrajectory
    properties
       String = ''; 
    end
    properties (SetObservable = true)
        entryPoint3D = Point3D.empty;
        targetPoint3D = Point3D.empty;
    end
    properties (Access = public, Dependent = true);
        entryPoint = NaN(3,1);
        targetPoint = NaN(3,1);
        direction = NaN(3,1);      
    end
    
    methods
       function str = toString(this)
            if(isempty(this.String))
                str = ['Trajectory Object with target ' num2str(this.targetPoint')];
            else
                str = this.String;
            end
        end
      
        function set.entryPoint3D(this, point3DObj)
            if(isa(point3DObj, 'Point3D'))
                this.entryPoint3D = point3DObj;
                this.notify('trajectoryChanged');
            end
        end
        
        function set.targetPoint3D(this, point3DObj)
            if(isa(point3DObj, 'Point3D'))
                this.targetPoint3D = point3DObj;
                this.notify('trajectoryChanged');
            end
        end
     
        function value = get.entryPoint(this)
            keyboard
       if ~isempty(ismissing(this.entryPoint3D.point, ''))
           if ~ismember(entryPoint3D.point,targetPoint3D.point) 
           
            value = this.entryPoint3D.point;
        else
      error (' entryPoint3D and targetPoint3D must be different.')
       end
       end
        end
        function value = get.targetPoint(this)
            %if entryPoint3D.point ~isequal (targetPoint3D.point)
            value = this.targetPoint3D.point;
           % else
          %error ('entryPoint3D and targetPoint3D must be different.')
        end
        %keyboard
        function set.entryPoint(this, point)
            if(isempty(this.entryPoint3D))
                this.entryPoint3D = Point3D();
            end
            this.entryPoint3D.point = point;  
            this.notify('trajectoryChanged');
        end
        
        function set.targetPoint(this, point)
            if(isempty(this.targetPoint3D))
                this.targetPoint3D = Point3D();
            end
            this.targetPoint3D.point = point;
            this.notify('trajectoryChanged');
        end
        
        function direction = get.direction(this)
            %normalized vector from entry to destination
            if norm(this.entryPoint3D.point - this.targetPoint3D.point) > 0
                direction = -((this.entryPoint3D.point - this.targetPoint3D.point) / norm(this.entryPoint3D.point - this.targetPoint3D.point));
            else
                error('Entry point and target points are the same. A direction cannot be determined.');
            end
        end
    end
end