/*
	숙박일수 구하기 (checkout date)	- (checkin date)
*/

	var dayCount = (function() {
		
		var getDateDiff = (d1, d2) => {
		  var date1 = new Date(d1);
		  var date2 = new Date(d2);
		  
		  var diffDate = date1.getTime() - date2.getTime();
		  
		  return Math.abs(diffDate / (1000 * 60 * 60 * 24));
		}
	
		
		return {getDateDiff : getDateDiff}
		
	})();	