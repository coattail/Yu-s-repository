function tree(n,x,y,stemAngle,stemLength,s,colr,branchRatio,bendAngle,branchAngle)
% Draw a level n tree with the root at position (x,y) using recursion.
% The main stem of the tree has angle stemAngle, length stemLength, color
% colr, where colr is a length 3 rgb vector, and a width that correlates
% with n.
% The lowest level tree has n=0 and is just the main stem--no branches.
% For n>0, at the top of the main stem draw three level n-1 trees. Each of
% these trees has color colr+r, where r is a random value from the Normal
% Distribution with mean zero and standard deviation s. Assume 0<s<1.
% The main stems
% Center branch: stem at the angle stemAngle+bendAngle,
%                stem length of (1-branchRatio)*stemLength
% Side 1 branch: stem at the angle stemAngle+bendAngle-branchAngle,
%                stem length of branchRatio*stemLength
% Side 2 branch: stem at the angle stemAngle+bendAngle+branchAngle,
%                stem length of branchRatio*stemLength
 width= 0.5; % line width must be positive
 if n > 0
     xnew = x+stemLength*cos(stemAngle);%Draw the base case- the trunk
     ynew = y+stemLength*sin(stemAngle);     
     plot([x,xnew], [y,ynew],...
     'LineWidth', width, 'Color', colr);
     
     colr = colr + randn*[s,s,s]; %Update the color
     for i = 1:3 %Consider the condition that color value out of range
         if colr(i)<0
             colr(i)=0;
         elseif colr(i)>1
             colr(i)=1;
         end
     end
     
     %Recursive method 
     tree(n-1, xnew, ynew,stemAngle+bendAngle,(1-branchRatio)*stemLength,s,colr,branchRatio,bendAngle,branchAngle);
     tree(n-1, xnew, ynew,stemAngle+bendAngle-branchAngle,branchRatio*stemLength,s,colr,branchRatio,bendAngle,branchAngle);
     tree(n-1, xnew, ynew,stemAngle+bendAngle+branchAngle,branchRatio*stemLength,s,colr,branchRatio,bendAngle,branchAngle);
 
 end    
 end

