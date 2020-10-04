namespace Domain
{
    public class Photo : BaseModel
    {
        public int PhotoId { get; set; }

        public byte[] Data { get; set; }
    }
}
