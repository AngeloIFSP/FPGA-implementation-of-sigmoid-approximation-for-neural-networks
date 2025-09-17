#! /usr/bin/octave -qf
close all
dx = 0.005;
x = [ -8:dx:8 ];
yStandard = 1 ./ ( 1 + exp( -x ) );
			% Adjustments of limits between domain regions:
xmed = 0;
minAvgAbsError = Inf;
minMaxAbsError = Inf;
for xinf = -6:0.01:-5
  for xmin = -4:0.01:-3
    xmax = -xmin;
    xsup = -xinf;
				% Ranges of x:
    xReg1 = [ -8:dx:xinf ];
    xReg2 = [ xinf+dx:dx:xmin ];
    xReg3 = [ xmin+dx:dx:xmed ];
    xReg4 = [ xmed+dx:dx:xmax-dx ];
    xReg5 = [ xmax:dx:xsup-dx ];
    xReg6 = [ xsup:dx:8 ];
				% yStandard per range:
    yReg1 = 1 ./ ( 1 + exp( -xReg1 ) );
    yReg2 = 1 ./ ( 1 + exp( -xReg2 ) );
    yReg3 = 1 ./ ( 1 + exp( -xReg3 ) );
    yReg4 = 1 ./ ( 1 + exp( -xReg4 ) );
    yReg5 = 1 ./ ( 1 + exp( -xReg5 ) );
    yReg6 = 1 ./ ( 1 + exp( -xReg6 ) );
			    % Polynomial coefficients calculation:
    p2 = polyfit( xReg2, yReg2, 1 ); % first degree
    p3 = polyfit( xReg3, yReg3, 2 ); % second degree
    p4 = polyfit( xReg4, yReg4, 2 ); % second degree
    p5 = polyfit( xReg5, yReg5, 1 ); % first degree
				% Error calculation:
    errorReg1 = zeros( 1, size( xReg1, 2 ) ) - 1 ./ ( 1 + exp( -xReg1 ) );
    errorReg2 = polyval( p2, xReg2 ) - 1 ./ ( 1 + exp( -xReg2 ) );
    errorReg3 = polyval( p3, xReg3 ) - 1 ./ ( 1 + exp( -xReg3 ) );
    errorReg4 = polyval( p4, xReg4 ) - 1 ./ ( 1 + exp( -xReg4 ) );
    errorReg5 = polyval( p5, xReg5 ) - 1 ./ ( 1 + exp( -xReg5 ) );
    errorReg6 = ones( 1, size( xReg6, 2 ) ) - 1 ./ ( 1 + exp( -xReg6 ) );
    errorAllRegions = [ errorReg1 errorReg2 errorReg3 errorReg4 errorReg5 errorReg6 ];
    avgAbsError = mean( abs( errorAllRegions ) );
    maxAbsError = max( abs( errorAllRegions ) );
    if( avgAbsError < minAvgAbsError )
      bestXinfAvgAbsError = xinf;
      bestXminAvgAbsError = xmin;
      minAvgAbsError = avgAbsError;
      maxAbsErrorImpl_1 = maxAbsError;
      bestP2AvgAbs = p2;
      bestP3AvgAbs = p3;
      bestP4AvgAbs = p4;
      bestP5AvgAbs = p5;
    endif
    if( maxAbsError < minMaxAbsError )
      bestXinfMaxAbsError = xinf;
      bestXminMaxAbsError = xmin;
      minMaxAbsError = maxAbsError;
      avgAbsErrorImpl_2 = avgAbsError;
      bestP2MaxAbs = p2;
      bestP3MaxAbs = p3;
      bestP4MaxAbs = p4;
      bestP5MaxAbs = p5;
    endif
  endfor
endfor
printf( "\nTo obtain minimal average absolute error:\n" )
bestXinfAvgAbsError
bestXminAvgAbsError
minAvgAbsError
xinf = bestXinfAvgAbsError
xmin = bestXminAvgAbsError
xmax = -xmin
xsup = -xinf
bestP2AvgAbs
bestP3AvgAbs
bestP4AvgAbs
bestP5AvgAbs
maxAbsErrorImpl_1
printf( "\n\nTo obtain minimal maximum absolute error:\n\n" )
bestXinfMaxAbsError
bestXminMaxAbsError
minMaxAbsError
xinf = bestXinfMaxAbsError
xmin = bestXminMaxAbsError
xmax = -xmin
xsup = -xinf
bestP2MaxAbs
bestP3MaxAbs
bestP4MaxAbs
bestP5MaxAbs
avgAbsErrorImpl_2
