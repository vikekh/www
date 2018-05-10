using System.Linq;

namespace Vikekh.Www.Core.Interfaces
{
    public interface IRepository<T>
    {
        IQueryable<T> List();
        bool Create(T item);
        bool Delete(int id);
        T Get(int id);
        bool SaveChanges();
    }
}
