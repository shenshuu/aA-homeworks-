class Track < ApplicationRecord
  belongs_to :album,
    class_name: 'Album',
    foreign_key: :album_id,
    primary_key: :id
end

def better_tracks_query 
  albums = self
    .albums
    .select('albums.*, COUNT(*) AS track_count')
    .joins(:tracks)
    .group(:album_id)

  album_count = {}
  albums.each {|album| album_count[album.id] = album.track_count}

  album_count
end