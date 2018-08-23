//: Playground - noun: a place where people can play

import Foundation

/**爬楼梯
 假设你正在爬楼梯。需要 n 阶你才能到达楼顶。
 
 每次你可以爬 1 或 2 个台阶。你有多少种不同的方法可以爬到楼顶呢？
 
 注意：给定 n 是一个正整数。
 
 示例 1：
 
 输入： 2
 输出： 2
 解释： 有两种方法可以爬到楼顶。
 1.  1 阶 + 1 阶
 2.  2 阶
 示例 2：
 
 输入： 3
 输出： 3
 解释： 有三种方法可以爬到楼顶。
 1.  1 阶 + 1 阶 + 1 阶
 2.  1 阶 + 2 阶
 3.  2 阶 + 1 阶
 
 4
 1 1 1 1
 0 1 2 1
 0 2 1 1
 0 1 1 2
 0 0 2 2
 
 5
 1 1 1 1 1
 2 1 1 1
 1 2 1 1
 1 1 2 1
 1 1 1 2
 1 2 2
 2 1 2
 2 2 1
 
 6
 111111
 21111
 12111
 11211
 11121
 11112
 
 2211
 1221
 1122
 2112
 
 1212
 2121
 
 222
 
 */

func climbStairs(_ n: Int) -> Int {
    if n == 1{
        return 1
    }else if n == 2 {
        return 2
    }else{
        return climbStairs(n-1) + climbStairs(n-2)
    }
}

climbStairs(6)
