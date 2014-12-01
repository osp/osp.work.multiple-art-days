'use strict';

var Geom, Point, Path, Segment;

Math.rad2deg = function rad2deg(rad){
	return rad * (180 / Math.PI);
}

Math.deg2rad = function deg2rad(deg){
	return deg * (Math.PI / 180);
}

Geom = {
	distance: function distance (a, b) {
		var dx, dy;
		dx = a.x - b.x;
		dy = a.y - b.y
		return Math.sqrt(dx*dx + dy*dy);
	},
	
	_at: function (p1, p2, t) {
		return (1 - t) * p1 + t * p2;
	},
	
	at: function (p1, p2, t) {
		return new Point(
			Geom._at(p1.x, p2.x, t),
			Geom._at(p1.y, p2.y, t)
		);
	},
};

Point = function (x,y) {
	if (x && y) {
		this.x = x;
		this.y = y;
	} else if (x && 'x' in x) {
		this.x = x.x;
		this.y = x.y;
	} else if (x && x.length > 1) {
		this.x = x[0];
		this.y = x[1];
	}
	
	return this;
};
	
Path = function (points) {
	this._segments = [];
	if (points) this.add(points);
	return this;
};

_.extend(Path.prototype, {
	add: function (point) {
		if (_.isArray(point)) {
			var points = point;
			for (var i=0;i<points.length;i++){
				this.add(points[i]); 
			}
		} else {
			if (this._segments.length == 0) {
				this._segments.push({
					start: -1,
					end: -1,
					segment: new Segment(point),
				});
			} else {
				if (this._segments.length == 1
					&& !this._segments[0].segment.p2) {
					this._segments[0].segment.p2 = point;
					this._length = this._segments[0].segment.length();
					this._updateIndex();
				} else {
					var p1 = _.last(this._segments).segment.p2;
					var segment = new Segment(p1, point);
					this._segments.push({start: -1, end: -1, segment: segment});
					this._length += segment.length();
					this._updateIndex();
				}
			}
		}
	},
	
	_updateIndex: function () {
		var offset = 0;
		
		_.each(this._segments, function (segment) {
			segment.start = offset;
			offset += (segment.segment.length() / this.length());
			segment.end = offset;
		}, this);
	},
	
	// calculates the lenght of the path
	length: function () {
		return this._length;
	},
	
	// Calculates point on line, goes live through all segments
	// so might be a bit slow
	at: function (t) {
		var segment = this._at(t);
		return segment.segment.at((t - segment.start) / (segment.end - segment.start));
	},
	
	angle: function (t) {
		return this.segment(t).angle();
	},
	
	segment: function (t) {
		return this._at(t).segment;
	},
	
	_at: function (t) {
		var at;
		
		_.each(this._segments, function(segment) {
			if (segment.start <= t 
				&& segment.end > t) {
				at = segment;
			}
		});
		
		if (!at) at = _.last(this._segments);
		
		return at;
	},
});

Segment = function (p1,p2) {
	var p1, p2;
	
	this.p1 = p1;
	this.p2 = p2;
	
	if (p1) {
		this.p1 = new Point(p1);
		
		if (p2) {
			this.p2 = new Point(p2);
		}
	}
	
	return this;
};

_.extend(Segment.prototype, {
	length: function () {
		return Geom.distance(this.p1, this.p2);
	},
		
	at: function (t) {
		return Geom.at(this.p1, this.p2, t);
	},
	
	angle: function () {
		return Math.atan((this.p2.y - this.p1.y) / (this.p2.x - this.p1.x));
	},
});


var point = function (x,y) {
	return new Point(x, y);
};