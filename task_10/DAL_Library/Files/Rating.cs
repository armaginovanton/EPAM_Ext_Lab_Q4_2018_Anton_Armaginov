using System;

namespace DAL_Library
{
    public class Rating
    {
        private int value;

        public void Set(int value)
        {
            this.value = value;
        }

        public int Get()
        {
            return this.value;
        }
    }
}