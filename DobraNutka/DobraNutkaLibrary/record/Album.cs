using System;
using System.Collections.Generic;
using System.Text;

namespace DobraNutkaLibrary
{
    public class Album
    {
        public int AlbumID { get; set; }
        public string AlbumTitle { get; set; }
        public int ArtistID { get; set; }
        public int GenreID { get; set; }
        public DateTime ReleaseDate { get; set; }
        public int FormatID { get; set; }
    }
}
